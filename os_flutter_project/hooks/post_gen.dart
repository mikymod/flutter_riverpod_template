import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final pubGetProgress = context.logger.progress('Installing packages...');
  final pubGetResult = await Process.run(
    'flutter',
    ['packages', 'get'],
    runInShell: true,
  );
  if (pubGetResult.exitCode == 0) {
    pubGetProgress.complete();
  } else {
    pubGetProgress.fail();
  }

  final buildRunnerProgress = context.logger.progress('Generating code...');
  final buildRunnerResult = await Process.run(
    'dart',
    ['run', 'build_runner', 'build', '-d'],
    runInShell: true,
  );

  if (buildRunnerResult.exitCode == 0) {
    buildRunnerProgress.complete();
  } else {
    buildRunnerProgress.fail();
    context.logger.info(buildRunnerResult.stderr);
    context.logger.info(buildRunnerResult.stdout);
  }
}
