part of stretch_module;

bool callMethod(Module module, String name, [List args = const []]) {
  var symbol = new Symbol(name);
  if(name.startsWith("_") ||
    reflectClass(module.runtimeType).instanceMembers.containsKey(symbol) ||
    reflectClass(Module).instanceMembers.containsKey(symbol)) {
    return false;
  }

  var method = reflectClass(module.runtimeType).instanceMembers[name];
  if(!method.isRegularMethod)
    return false;

  reflect(module).invoke(symbol, args);
  return true;
}