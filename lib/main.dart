import 'package:flutter/material.dart';
import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:easy_mask/easy_mask.dart';
import 'Models/model_table_cliente.dart';
import 'Models/model_form_cliente.dart';
import 'RowAdapter.dart';

void main() {
  runApp(MyApp());
  doWhenWindowReady(() {
    final win = appWindow;
    final initialSize = Size(600, 450);
    win.minSize = initialSize;
    win.maxSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Lotus - Cadastro simples de clientes";
    win.show();
  });
}


const borderColor = Color(0xFF805306);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
         
        ],
        supportedLocales: [
         Locale('pt', 'BR'), 
          
        ],
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: WindowBorder(
                      color: borderColor,
                      width: 1,
                      child: Row( children: [ Home() ] )
                  )
              )
          );
  }
}
class Home extends StatefulWidget{
  @override
  Home_state createState() => Home_state();
}

class Home_state extends State<Home>  {

    var form_cliente = FORM_CLIENTE();
    double  razao_width = 100;
    double  fantazia_width = 302;
  @override
  Widget build(BuildContext context) {
 
    form_cliente.setContext(context);

    return Expanded(
        child: Container(
            decoration: BoxDecoration(color: Color(0xFF3F51B5)),
            child: Column(children: [
              WindowTitleBarBox(
                  child: Row(children: [
                Expanded(child: MoveWindow()),
                Row(
                  children: [
                    MinimizeWindowButton(
                        colors: WindowButtonColors(
                                    iconNormal: Colors.white,
                                    mouseOver: Color(0x69E8EAF6),
                                    mouseDown: Color(0x69C5CAE9),
                                    iconMouseOver: Colors.white,
                                    iconMouseDown: Colors.white)
                                ),
                    CloseWindowButton(
                        colors: WindowButtonColors(
                                    mouseOver: Color(0xFFD32F2F),
                                    mouseDown: Color(0xFFB71C1C),
                                    iconNormal: Colors.white,
                                    iconMouseOver: Colors.white)
                                ),
                  ],
                ),
              ])),
              Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only( bottom: 5.0, left: 5.0, right: 10.0, top: 5.0),
                      height: 35,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Color(0xffECEFF1),
                          borderRadius: BorderRadius.circular(5)
                      ),

                      child:  TextField(
                        
                        keyboardType: TextInputType.number,
                        key: Key('CNPJ_CPF'),
                        controller: form_cliente.CNPJ_CPF,
                        onChanged: (v) => {
                            if(form_cliente.CNPJ_CPF.text.length > 14){                            
                              
                              setState((){
                                razao_width = 200;
                                fantazia_width = 200;

                              })
                              
                            }else{
                            
                              setState((){
                                razao_width = 100;
                                fantazia_width = 302;
                              })
                            }
                          },
                        inputFormatters: [
                                            TextInputMask(
                                                mask: ['999.999.999-99', '99.999.999/9999-99'],
                                                reverse: false)
                                          ],
                        decoration: const InputDecoration(
                            contentPadding:EdgeInsets.all(5.0),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide (
                                    color: Color(0xFF3F51B5)
                                )
                            ),
                            border: OutlineInputBorder(),
                            hintText: 'CNPJ/CPF'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only( right: 10.0),
                      height: 35,
                      width: 150,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Row(
                        children: [
                          Tooltip(
                            message:'Novo',
                            child:ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Color(0xffECEFF1),
                                            onPrimary:Color(0xff757575),
                                            shape: new RoundedRectangleBorder(),
                                            fixedSize: Size(50,35),
                                            minimumSize: Size(50,35)
                                        ),
                                        onPressed: () {},
                                        child: const Icon(Icons.note_add),
                                  )
                          ),
                          Tooltip(
                            message: 'Salvar',
                            child:ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Color(0xffECEFF1),
                                          onPrimary:Color(0xff757575),
                                          shape: new RoundedRectangleBorder(),
                                          fixedSize: Size(50,35),
                                          minimumSize: Size(50,35)
                                      ),
                                      onPressed: () => form_cliente.save(),
                                      child: const Icon(Icons.save),
                                  )

                          ),
                          Tooltip(
                            message:'Deletar',
                            child: ElevatedButton(                            
                                      style: ElevatedButton.styleFrom(
                                          primary: Color(0xffECEFF1),
                                          onPrimary:Color(0xff757575),
                                          shape: new RoundedRectangleBorder(),
                                          fixedSize: Size(50,35),
                                          minimumSize: Size(50,35)
                                      ),
                                      onPressed: () {},
                                      child: const Icon(Icons.delete),
                                  )
                          )
                          ,
                        ],
                      ),
                    ),
                  ],
                ),


              CustomPaint(
                  child: Container(
                    height: 350,
                    //decoration: BoxDecoration(color: Color(0xffffffff)),
                    child: Column(
                      children: [

                        Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 0.0,left: 10.0, right: 10.0,top: 10.0),

                                  height: 130,
                                  child: Column(
                                      children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children:  [
                                              AnimatedContainer(
                                                  width: fantazia_width,
                                                  duration: Duration(milliseconds: 300),
                                                  child: Container(                                                   
                                                            height: 35,
                                                            margin: EdgeInsets.only(right: 3),
                                                            child:TextField(
                                                                    controller: form_cliente.Nome_fisico_juridico,
                                                                    decoration:  InputDecoration(
                                                                        contentPadding: EdgeInsets.all(5.0),
                                                                        focusedBorder: OutlineInputBorder(
                                                                            borderSide: const BorderSide (
                                                                              color: Color(0xFF3F51B5)
                                                                            )
                                                                        ),
                                                                        border: OutlineInputBorder(),
                                                                        labelStyle: TextStyle(
                                                                            color: Color(0xFF757575)
                                                                        ),
                                                                        labelText: form_cliente.CNPJ_CPF.text.length > 14 ? "Nome Fantazia" : "Nome Completo" ,

                                                                    ),
                                                                    
                                                                  )

                                                          ),
                                                ),
                                                
                                                AnimatedContainer(
                                                  width: razao_width,
                                                  duration: Duration(milliseconds: 300),
                                                  child:Container(
                                                 
                                                    height: 35,
                                                    child:TextField(
                                                              controller: form_cliente.RazaoSocial_nascimento,
                                                              decoration:  InputDecoration(
                                                                  contentPadding:EdgeInsets.all(5.0),
                                                                  focusedBorder: OutlineInputBorder(
                                                                        borderSide: const BorderSide (
                                                                            color: Color(0xFF3F51B5)
                                                                        )
                                                                  ),
                                                                  border: OutlineInputBorder(),
                                                                  labelStyle: TextStyle(
                                                                      color: Color(0xFF757575)
                                                                  ),
                                                                  labelText: form_cliente.CNPJ_CPF.text.length > 14 ? 'Razão Social' : "Nascimento"
                                                              ),
                                                              inputFormatters: [
                                                                                TextInputMask(
                                                                                  mask: [form_cliente.CNPJ_CPF.text.length > 14 ? "X+" : "99/99/9999" ],
                                                                                  reverse: false)
                                                                                ],
                                                          )

                                              )
                                                ),
                                                
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children:  [
                                            Container(
                                                width: 260,
                                                height: 35,
                                                margin: EdgeInsets.only(right: 3,top: 5),
                                                child:TextField(
                                                  controller: form_cliente.Email,
                                                  decoration: const InputDecoration(
                                                      contentPadding:EdgeInsets.all(5.0),
                                                      focusedBorder: OutlineInputBorder(
                                                          borderSide: const BorderSide (
                                                              color: Color(0xFF3F51B5)
                                                          )
                                                      ),
                                                      border: OutlineInputBorder(),
                                                      labelStyle: TextStyle(
                                                          color: Color(0xFF757575)
                                                      ),
                                                      labelText: 'Email'
                                                  ),
                                                )

                                            ),
                                            Container(
                                                width: 140,
                                                height: 35,
                                                margin: EdgeInsets.only(top: 5),
                                                
                                                child:TextField(
                                                  controller: form_cliente.Telefone,
                                                  inputFormatters: [
                                                                        TextInputMask(
                                                                            mask: ['(99) 9999-9999', '(99) 99999-9999'],
                                                                            reverse: false)                                                                          
                                                                      ],
                                                  decoration: const InputDecoration(
                                                      contentPadding:EdgeInsets.all(5.0),
                                                      focusedBorder: OutlineInputBorder(
                                                          borderSide: const BorderSide (
                                                              color: Color(0xFF3F51B5)
                                                          )
                                                      ),
                                                      
                                                      border: OutlineInputBorder(),
                                                      labelStyle: TextStyle(
                                                          color: Color(0xFF757575)
                                                      ),
                                                      labelText: 'Telefone'
                                                  ),
                                                )

                                            )
                                          ],
                                        ),
                                        Row(

                                          children:  [
                                            Container(
                                                width: 90,
                                                height: 35,
                                                margin: EdgeInsets.only(right: 3,top: 5),
                                                child:TextField(
                                                  controller: form_cliente.Cep,
                                                  decoration: const InputDecoration(
                                                      contentPadding:EdgeInsets.all(5.0),
                                                      focusedBorder: OutlineInputBorder(
                                                          borderSide: const BorderSide (
                                                              color: Color(0xFF3F51B5)
                                                          )
                                                      ),
                                                      border: OutlineInputBorder(),
                                                      labelStyle: TextStyle(
                                                          color: Color(0xFF757575)
                                                      ),
                                                      labelText: 'CEP'
                                                  ),
                                                )

                                            ),
                                            Container(
                                                width: 200,
                                                height: 35,
                                                margin: EdgeInsets.only(top: 5,right: 3),
                                                child:TextField(
                                                  controller: form_cliente.Numero,
                                                  decoration: const InputDecoration(
                                                      contentPadding:EdgeInsets.all(5.0),
                                                      focusedBorder: OutlineInputBorder(
                                                          borderSide: const BorderSide (
                                                              color: Color(0xFF3F51B5)
                                                          )
                                                      ),
                                                      border: OutlineInputBorder(),
                                                      labelStyle: TextStyle(
                                                          color: Color(0xFF757575)
                                                      ),
                                                      labelText: 'Endereço'
                                                  ),
                                                )

                                            ),
                                            Container(
                                                width: 60,
                                                height: 35,
                                                margin: EdgeInsets.only(top: 5,right: 3),
                                                child:TextField(
                                                  controller: form_cliente.Bairro,
                                                  decoration: const InputDecoration(
                                                      contentPadding:EdgeInsets.all(5.0),
                                                      focusedBorder: OutlineInputBorder(
                                                          borderSide: const BorderSide (
                                                              color: Color(0xFF3F51B5)
                                                          )
                                                      ),
                                                      border: OutlineInputBorder(),
                                                      labelStyle: TextStyle(
                                                          color: Color(0xFF757575)
                                                      ),
                                                      labelText: 'Numero'
                                                  ),
                                                )

                                            ),
                                            Container(
                                                width: 100,
                                                height: 35,
                                                margin: EdgeInsets.only(top: 5,right: 3),
                                                child:TextField(
                                                  controller: form_cliente.Cidade,
                                                  decoration: const InputDecoration(
                                                      contentPadding:EdgeInsets.all(5.0),
                                                      focusedBorder: OutlineInputBorder(
                                                          borderSide: const BorderSide (
                                                              color: Color(0xFF3F51B5)
                                                          )
                                                      ),
                                                      border: OutlineInputBorder(),
                                                      labelStyle: TextStyle(
                                                          color: Color(0xFF757575)
                                                      ),
                                                      labelText: 'Bairro'
                                                  ),
                                                )

                                            ),Container(
                                                width: 115,
                                                height: 35,
                                                margin: EdgeInsets.only(top: 3),
                                                child:TextField(
                                                  decoration: const InputDecoration(
                                                      contentPadding:EdgeInsets.all(5.0),
                                                      focusedBorder: OutlineInputBorder(
                                                          borderSide: const BorderSide (
                                                              color: Color(0xFF3F51B5)
                                                          )
                                                      ),
                                                      border: OutlineInputBorder(),
                                                      labelStyle: TextStyle(
                                                          color: Color(0xFF757575)
                                                      ),
                                                      labelText: 'Cidade'
                                                  ),
                                                )

                                            )
                                          ],
                                        )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 3.0,left: 10.0,right: 10.0,top: 0.0),
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                                  border: Border.all(color: Color(0xffB0BEC5), width: 1),
                                                  borderRadius: BorderRadius.circular(5),
                                              ),
                                  height: 180,
                                  child: Column(

                                    children: [
                                      Container(

                                            height: 30,
                                            decoration: BoxDecoration(
                                                            color: Color(0xffECEFF1),
                                                            borderRadius: BorderRadius.circular(5)
                                                        ),
                                            child: TextField(
                                                        decoration: const InputDecoration(
                                                            contentPadding:EdgeInsets.all(5.0),
                                                            focusedBorder: OutlineInputBorder(
                                                                                borderSide: const BorderSide (
                                                                                                      color: Color(0xFF3F51B5)
                                                                                                  )
                                                                            ),
                                                            border: OutlineInputBorder(),
                                                            hintText: 'Buscar clientes'),
                                                  ),
                                      ),
                                      Flexible(

                                        child: SfDataGrid(
                                            headerRowHeight: 25.0,
                                            rowHeight: 25.0,
                                            selectionMode: SelectionMode.single,
                                            gridLinesVisibility: GridLinesVisibility.both,
                                            columnWidthMode: ColumnWidthMode.fill,
                                            columns: <GridColumn>[
                                                GridColumn(
                                                      width: 150,
                                                      columnName: 'CNPJ/CPF',
                                                      label: Container(
                                                                
                                                                alignment: Alignment.center,
                                                                child: Text('CNPJ/CPF')
                                                              )
                                                  ),
                                                  GridColumn(
                                                      columnName: 'Nome',
                                                      label: Container(
                                                                alignment: Alignment.center,
                                                                child: Text('Nome/Razão Social')
                                                              )
                                                  ),                                                
                                                  GridColumn(
                                                      columnName: 'telefone',
                                                      width: 150,
                                                      label: Container(
                                                                height: 10,
                                                                alignment: Alignment.center,
                                                                child: Text('Telefone')
                                                              )
                                                  ),
                                            ],
                                            source: RowAdapter(employeeData: form_cliente.DataTable),                                            
                                            onSelectionChanging: (List<DataGridRow> addedRows, List<DataGridRow> removedRows) {
                                                                      print(addedRows[0].getCells()[0].value);

                                                                      return true;

                                                                    
                                                                },
                                           


                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                    "Criado por Melquizedeque S. Lobo     V 1.0")
                              ],
                            ),
                            Positioned(
                              child: Container(
                                          padding: EdgeInsets.all(10.0),
                                          margin: EdgeInsets.only(left: 48.0, top: 0),
                                          transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                                          width: 120,
                                          height: 120,
                                          decoration: BoxDecoration(
                                                          border:Border.all(color: Colors.white, width: 5),
                                                          shape: BoxShape.circle,
                                                          color: Colors.white,
                                                          // image: DecorationImage(
                                                          //  fit: BoxFit.cover,
                                                          //    image: AssetImage('images/profile.png'),
                                                          //    ),
                                                      ),
                                      ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  painter: MyPainter())
            ])));
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1

    paint.color = Color(0xffffffff);
    path = Path();

    path.lineTo(size.width * 0.31, 0);
    path.cubicTo(size.width * 0.3, size.height * 0.01, size.width * 0.3, size.height * 0.01, size.width * 0.3, size.height * 0.02);
    path.cubicTo(size.width * 0.3, size.height * 0.18, size.width / 5,   size.height * 0.28, size.width * 0.12, size.height / 5);
    path.cubicTo(size.width * 0.08, size.height * 0.16, size.width * 0.06, size.height * 0.09, size.width * 0.06, size.height * 0.02);
    path.cubicTo(size.width * 0.06, size.height * 0.01, size.width * 0.06,  size.height * 0.01, size.width * 0.05, 0);  path.cubicTo(size.width * 0.05, 0, 0, 0, 0, 0);
    path.cubicTo(0, 0, 0, size.height, 0, size.height);
    path.cubicTo( 0, size.height, size.width, size.height, size.width, size.height);  path.cubicTo(size.width, size.height, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width * 0.31, 0, size.width * 0.31, 0);
    path.cubicTo(size.width * 0.31, 0, size.width * 0.31, 0, size.width * 0.31, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}