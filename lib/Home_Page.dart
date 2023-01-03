import 'dart:ui';

import 'package:finish_2022/Empleado.dart';
import 'package:finish_2022/bloc/empleado_bloc.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EmpleadoBloc _empleadoBloc =EmpleadoBloc();
  @override
  void dispose(){
    super.dispose();
    _empleadoBloc.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child:  StreamBuilder<List<Empleado>>(
          stream: _empleadoBloc.empleadoListStream,
          builder: (BuildContext context , AsyncSnapshot<List<Empleado>> snapshot) {
return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder:((context, index) {
              return Card(
                elevation: 5.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Text("${snapshot.data?[index].id}",
                      style: TextStyle(fontSize: 20.0),),
                      
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${snapshot.data?[index].name}",
                          style: TextStyle(fontSize: 18.0),
                          ),
                          Text("${snapshot.data?[index].salary}",
                          style: TextStyle(fontSize: 18.0),)
                          
                        ],
                      ),
                    ),
                    Container(
                      child: IconButton(onPressed: (){
                        _empleadoBloc.empleadoSalaryIncrement.add(snapshot.data![index]);
                      }, icon: Icon(Icons.thumb_up)),
                    ),
                    Container(
                      child: IconButton(onPressed: (){
                        _empleadoBloc.empleadoSalaryDecremet.add(snapshot.data![index]);
                      }, icon: Icon(Icons.thumb_down)),
                    ),
                  ],
                ),
              );
              
            }) );
          } 
          
            
           ),
           ),
      
    );
  }
}