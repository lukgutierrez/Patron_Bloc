import 'dart:async';
import 'package:finish_2022/Empleado.dart';
class EmpleadoBloc{
  List<Empleado> empleadoList =[
    Empleado(1, "pedro", 1000.0),
    Empleado(1, "pedro", 1000.0),
    Empleado(1, "pedro", 1000.0),
    Empleado(1, "pedro", 1000.0)
  ];


//STREAMCONTROLLER
final _empleadoListStreamController = StreamController<List<Empleado>>();
final _empleadoSalaryIncrementStreamController = StreamController<Empleado>();
final _empleadoSalaryDecremetStreamController = StreamController();

// Getters: streams y sinks
Stream <List<Empleado>> get empleadoListStream => _empleadoListStreamController.stream;
StreamSink <List<Empleado>> get empleadoListSink => _empleadoListStreamController.sink;

StreamSink<Empleado> get empleadoSalaryIncrement => _empleadoSalaryIncrementStreamController.sink;
StreamSink<Empleado> get empleadoSalaryDecremet => _empleadoSalaryDecremetStreamController.sink;

//Constructor

EmpleadoBloc(){
  _empleadoListStreamController.add(empleadoList);
  _empleadoSalaryIncrementStreamController.stream.listen(_incrementSalary);
  _empleadoSalaryDecremetStreamController.stream.listen(_decrementSalary);
}

//Core Funcption
_incrementSalary(Empleado empleado){
  double salaryActual = empleado.salary;
  double salaryIncrement = salaryActual * 20/100;
  empleadoList[empleado.id -1].salary = salaryActual + salaryIncrement;
  empleadoListSink.add(empleadoList);
}

_decrementSalary(Empleado empleado){
  double salaryActual = empleado.salary;
  double salaryIncrement = salaryActual * 20/100;
  empleadoList[empleado.id -1].salary = salaryActual + salaryIncrement;
  empleadoListSink.add(empleadoList);
}


// Dispose

void dispose(){
  _empleadoSalaryIncrementStreamController.close();
  _empleadoSalaryDecremetStreamController.close();
  _empleadoListStreamController.close();
}



}