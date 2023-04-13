import 'package:flutter/material.dart';
import 'package:flutter_myappication_1/utility/my_constant.dart';
import 'package:flutter_myappication_1/widgets/show_title.dart';

class PDPA extends StatefulWidget {
  const PDPA({Key? key}) : super(key: key);

  @override
  State<PDPA> createState() => _PDPAState();
}

class _PDPAState extends State<PDPA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อกำหนดและเงื่อนไข'),
        backgroundColor: MyConstant.primary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: MyConstant.dark),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  ShowTitle(title: 'ประกาศกระทรวงดิจิทัลเพื่อเศรษฐกิจและสังคม'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShowTitle(title: 'เรื่อง'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShowTitle(
                      title:
                          '   มาตรฐานการรักษาความมั่นคงปลอดภัยของข้อมูลส่วนบุคคล พ.ศ. ๒๕๖๓ โดยที่มาตรา ๓ วรรคสอง แห่งพระราชกฤษฎีกากำหนดหน่วยงานและกิจการที่ผู้ควบคุม ข้อมูลส่วนบุคคลไม่อยู่ภายใต้บังคับแห่งพระราชบัญญัติคุ้มครองข้อมูลส่วนบุคคล พ.ศ. ๒๕๖๒ พ.ศ. ๒๕๖๓ กำหนดให้ผู้ควบคุมข้อมูลซึ่งเป็นหน่วยงานหรือกิจการตามบัญชีท้ายพระราชกฤษฎีกาดังกล่าวต้องจัดให้มี มาตรการรักษาความปลอดภัยของข้อมูลส่วนบุคคลให้เป็นไปตามมาตรฐานที่กระทรวงดิจิทัล เพื่อเศรษฐกิจและสังคมกำหนด อาศัยอำนาจตามความในมาตรา ๓ วรรคสอง แห่งพระราชกฤษฎีกากำหนดหน่วยงาน และกิจการที่ผู้ควบคุมข้อมูลส่วนบุคคลไม่อยู่ภายใต้บังคับแห่งพระราชบัญญัติคุ้มครองข้อมูลส่วนบุคคล พ.ศ. ๒๕๖๒ พ.ศ. ๒๕๖๓ รัฐมนตรีว่าการกระทรวงดิจิทัลเพื่อเศรษฐกิจและสังคมจึงออกประกาศไว้ ดังนี้',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShowTitle(
                        title:
                            'ข้อ 1 ประกาศนี้เรียกว่า “ประกาศกระทรวงดิจิทัลเพื่อเศรษฐกิจและสังคม เรื่อง มาตรฐาน การรักษาความมั่นคงปลอดภัยของข้อมูลส่วนบุคคล พ.ศ. ๒๕๖๓”'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShowTitle(
                        title:
                            'ข้อ 2 ประกาศนี้ให้ใช้บังคับตั้งแต่วันถัดจากวันประกาศในราชกิจจานุเบกษาจนถึงวันที่ ๓๑ พฤษภาคม ๒๕๖๔'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShowTitle(
                        title:
                            'ข้อ 3 ในประกาศนี้ “ผู้ควบคุมข้อมูลส่วนบุคคล” หมายความว่า ผู้ควบคุมข้อมูลส่วนบุคคลซึ่งเป็นหน่วยงาน หรือกิจการตามบัญชีท้ายพระราชกฤษฎีกากำหนดหน่วยงานและกิจการที่ผู้ควบคุมข้อมูลส่วนบุคคล ไม่อยู่ภายใต้บังคับแห่งพระราชบัญญัติคุ้มครองข้อมูลส่วนบุคคล พ.ศ. ๒๕๖๒ พ.ศ. ๒๕๖๓ “ความมั่นคงปลอดภัยของข้อมูลส่วนบุคคล” หมายความว่า การธำรงไว้ซึ่งความลับ (confidentiality) ความถูกต้องครบถ้วน (integrity) และสภาพพร้อมใช้งาน (availability) ของข้อมูลส่วนบุคคล ทั้งนี้ เพื่อป้องกันการสูญหาย เข้าถึง ใช้ เปลี่ยนแปลง แก้ไข หรือเปิดเผย ข้อมูลส่วนบุคคลโดยมิชอบ'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShowTitle(
                        title:
                            'ข้อ 4 ผู้ควบคุมข้อมูลส่วนบุคคลต้องแจ้งมาตรการรักษาความมั่นคงปลอดภัยของข้อมูล ส่วนบุคคลตามประกาศนี้ ให้แก่บุคลากร พนักงาน ลูกจ้างหรือบุคคลที่เกี่ยวข้องทราบ รวมถึง สร้างเสริมความตระหนักรู้ด้านความสำคัญของการคุ้มครองข้อมูลส่วนบุคคลให้กับกลุ่มบุคคลดังกล่าว ปฏิบัติตามมาตรการที่กำหนดอย่างเคร่งครัด'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShowTitle(
                        title:
                            'ข้อ 5 ผู้ควบคุมข้อมูลส่วนบุคคลต้องจัดให้มีมาตรการรักษาความมั่นคงปลอดภัยของข้อมูล ส่วนบุคคล ซึ่งควรครอบคลุมถึงมาตรการป้องกันด้านการบริหารจัดการ (administrative safeguard) มาตรการป้องกันด้านเทคนิค (technical safeguard) และมาตรการป้องกันทางกายภาพ (physical safeguard) ในเรื่องการเข้าถึงหรือควบคุมการใช้งานข้อมูลส่วนบุคคล (access control) โดยอย่างน้อย ต้องประกอบด้วยการดำเนินการ ดังต่อไปนี้'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: ShowTitle(
                        title:
                            '(5.1) การควบคุมการเข้าถึงข้อมูลส่วนบุคคลและอุปกรณ์ในการจัดเก็บและประมวลผลข้อมูล ส่วนบุคคลโดยคำนึงถึงการใช้งานและความมั่นคงปลอดภัย'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: ShowTitle(
                        title:
                            '(5.2) การกำหนดเกี่ยวกับการอนุญาตหรือการก าหนดสิทธิในการเข้าถึงข้อมูลส่วนบุคคล'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: ShowTitle(
                        title:
                            '(5.3) การบริหารจัดการการเข้าถึงของผู้ใช้งาน (user access management) เพื่อควบคุม การเข้าถึงข้อมูลส่วนบุคคลเฉพาะผู้ที่ได้รับอนุญาตแล้ว'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: ShowTitle(
                        title:
                            '(5.4) การกำหนดหน้าที่ความรับผิดชอบของผู้ใช้งาน(user responsibilities) เพื่อป้องกัน การเข้าถึงข้อมูลส่วนบุคคลโดยไม่ได้รับอนุญาต การเปิดเผย การล่วงรู้ หรือการลักลอบท าสำเนาข้อมูล ส่วนบุคคล การลักขโมยอุปกรณ์จัดเก็บหรือประมวลผลข้อมูลส่วนบุคคล'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: ShowTitle(
                        title:
                            '(5.5) การจัดให้มีวิธีการเพื่อให้สามารถตรวจสอบย้อนหลังเกี่ยวกับการเข้าถึง เปลี่ยนแปลง ลบ หรือถ่ายโอนข้อมูลส่วนบุคคล ให้สอดคล้องเหมาะสมกับวิธีการและสื่อที่ใช้ในการเก็บรวบรวม ใช้ หรือเปิดเผยข้อมูลส่วนบุคคล'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShowTitle(
                        title:
                            'ข้อ 6 ผู้ควบคุมข้อมูลส่วนบุคคลอาจเลือกใช้มาตรฐานการรักษาความมั่นคงปลอดภัย ของข้อมูลส่วนบุคคลที่แตกต่างไปจากประกาศฉบับนี้ได้ หากมาตรฐานดังกล่าวมีมาตรการรักษา ความมั่นคงปลอดภัยไม่ต่ำกว่าที่กำหนดในประกาศนี้'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShowTitle(
                        title:
                            'ข้อ 7 ให้รัฐมนตรีว่าการกระทรวงดิจิทัลเพื่อเศรษฐกิจและสังคมรักษาการตามประกาศนี้ และให้มีอำนาจตีความและวินิจฉัยปัญหาอันเกิดจากการปฏิบัติตามประกาศนี้'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 4),
                    child: ShowTitle(
                        title: 'ประกาศ ณ วันที่ 24 มิถุนายน พ.ศ. 2563'),
                  ),
                  ShowTitle(title: 'พุทธิพงษ์ ปุณณกันต์   '),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 8),
                    child: ShowTitle(
                        title:
                            'รัฐมนตรีว่าการกระทรวงดิจิทัลเพื่อเศรษฐกิจและสังคม'),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pushNamed(
                        context, MyConstant.routeCreasteAccount),
                    child: ShowTitle(
                      title: 'ยินยอม',
                      textStyle: MyConstant().h3WhiteStyle(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: ShowTitle(
                      title: 'ไม่ยินยอม',
                      textStyle: MyConstant().h3WhiteStyle(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
