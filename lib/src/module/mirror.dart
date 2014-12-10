part of stretch_module;

bool callMethod(Module module, String name, [List args = const []]) {
  reflect(module).invoke(name, args);
  return true;
}