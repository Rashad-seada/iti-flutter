import 'dart:async';

// Define a cancellable operation class
class Worker {
  bool _isCancelled = false;
  Completer<void> _completer = Completer<void>();

  // Function to perform the job
  final Future<void> Function() jobFunction;

  Worker(this.jobFunction);

  // Cancel the job
  void cancel() {
    _isCancelled = true;
    _completer.complete();
  }

  // Check if the job is cancelled
  bool get isCancelled => _isCancelled;

  // Start the job
  Future<void> start() async {
    if (_isCancelled) {
      return;
    }

    try {
      // Execute the job function
      await jobFunction();

      // Check if the job has been cancelled after completion
      if (_isCancelled) {
        print('Job was cancelled after completion.');
        _completer.complete();
      } else {
        print('Job completed successfully.');
        _completer.complete();
      }
    } catch (e) {
      print('Error executing job: $e');
      _completer.completeError(e);
    }
  }

  // Wait for the job to complete
  Future<void> waitForCompletion() {
    return _completer.future;
  }
}

// Example usage
void main() async {
  // Define the job function
  Future<void> myJobFunction() async {
    // Simulate some asynchronous work
    await Future.delayed(Duration(seconds: 2));
    print('Job function executed.');
  }

  // Create a cancellable job with the job function
  var job = Worker(myJobFunction);

  // Start the job
  job.start();

  // Wait for some time
  await Future.delayed(Duration(seconds: 1));

  // Cancel the job
  job.cancel();

  // Wait for the job to complete (optional)
  await job.waitForCompletion();

  // Check if the job was cancelled or completed
  if (job.isCancelled) {
    print('Job was cancelled.');
  } else {
    print('Job completed.');
  }
}
