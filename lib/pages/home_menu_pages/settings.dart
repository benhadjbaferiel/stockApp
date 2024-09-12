import 'package:flutter/material.dart';
import '/widgets.dart/custom_drop_down_menu.dart';
import '/widgets.dart/custom_Input_Settings.dart';
import '/widgets.dart/switch_Title.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final formKey2 = GlobalKey<FormState>();

  final List<String> language = ['---', 'français', 'Anglais', 'العربية'];
  final List<String> sizePic = [
    '16',
    '32',
    '48',
    '64',
    '96',
    '128',
  ];
  final List<String> number = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
  ];
  final List<String> size = [
    'كبير',
    'صغير',
    'وسط',
  ];
  final List<String> joz2 = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  final List<String> countries = [
    '---',
    'مصر',
    'الجزائر',
    'السودان',
    'العراق',
    'المغرب',
    'السعودية',
    'اليمن',
    'سوريا',
    'الصومال',
    'تونس',
    'الامارات العربية المتحدة',
    'الاردن',
    'ليبيا',
    'فلسطين',
    'عمان',
    'الكويت',
    'موريطانيا',
    'قطر',
    'البحرين',
    'جيبوتي',
    'جزر القمر',
    'اخرى',
  ];

  String? selectedCountry;
  String? selectedLanguage;
  String? selectedJoz2;
  String? selectedSize;
  String? selectedSizPic;
  String? selectedNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                      ),
                      Row(
                        children: [
                          const Text(
                            "     الاعدادات",
                            style: TextStyle(fontSize: 40),
                          ),
                          const SizedBox(width: 50),
                          Image.asset(
                            'images/20.png',
                            width: 110,
                            height: 110,
                            alignment: Alignment.topLeft,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      CustomDropMenu(
                          label: 'الدولة',
                          items: countries,
                          onChanged: (value) {
                            setState(() {
                              selectedCountry = value;
                            });
                          },
                          selectedValue: selectedCountry),
                      const SizedBox(height: 20),
                      CustomDropMenu(
                          label: 'اللغة',
                          items: language,
                          onChanged: (value) {
                            setState(() {
                              selectedLanguage = value;
                            });
                          },
                          selectedValue: selectedLanguage),
                      SizedBox(
                        height: 20,
                      ),
                      CustomSettings(label: 'العملة'),
                      SizedBox(
                        height: 20,
                      ),
                      CustomSettings(label: 'اجزاء العملة'),
                      SizedBox(
                        height: 20,
                      ),
                      CustomDropMenu(
                          label: 'عدد الاجزاء',
                          items: joz2,
                          onChanged: (value) {
                            setState(() {
                              selectedJoz2 = value;
                            });
                          },
                          selectedValue: selectedJoz2),
                      const SizedBox(height: 20),
                      CustomSettings(label: 'اسم المتجر'),
                      SizedBox(
                        height: 20,
                      ),
                      CustomSettings(label: 'العنوان'),
                      SizedBox(
                        height: 20,
                      ),
                      CustomSettings(label: 'رقم الهاتف'),
                      SizedBox(
                        height: 20,
                      ),
                      CustomSettings(label: 'الرقم الضريبي'),
                      SizedBox(
                        height: 20,
                      ),
                      CustomSettings(label: 'رقم التسجيل الضريبي'),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomDropMenu(
                          label: 'حجم الشعار',
                          items: size,
                          onChanged: (value) {
                            setState(() {
                              selectedSize = value;
                            });
                          },
                          selectedValue: selectedSize),
                      const SizedBox(height: 20),
                      CustomSwitch(
                        action: true, // Initial state of the switch
                        label: 'التحذير حال نقص المخزون',
                      ),
                      const SizedBox(height: 20),
                      CustomSwitch(
                        action: true, // Initial state of the switch
                        label: 'منع البيع في حال نفاذ المخزون',
                      ),
                      const SizedBox(height: 20),
                      CustomSwitch(
                        action: true, // Initial state of the switch
                        label: 'السماح بتكرار المنتج أثناء البيع',
                      ),
                      const SizedBox(height: 20),
                      CustomSwitch(
                        action: true, // Initial state of the switch
                        label: 'السماح ببيع بالأجل',
                      ),
                      const SizedBox(height: 20),
                      CustomSwitch(
                        action: true, // Initial state of the switch
                        label: 'عدم السماح بعرض السعر',
                      ),
                      const SizedBox(height: 20),
                      CustomSwitch(
                        action: true, // Initial state of the switch
                        label: 'عدم السماح بتعديل السعر في العميات',
                      ),
                      const SizedBox(height: 20),
                      CustomSwitch(
                        action: true, // Initial state of the switch
                        label: ' اظهار سعر التكلفة في شاشة البيع',
                      ),
                      const SizedBox(height: 20),
                      CustomSwitch(
                        action: true, // Initial state of the switch
                        label: 'عدم السماح ببيع بأقل من التكلفة',
                      ),
                      const SizedBox(height: 20),
                      CustomSwitch(
                        action: true, // Initial state of the switch
                        label: 'السماح بتعديل تاريخ البيع',
                      ),
                      const SizedBox(height: 20),
                      CustomSwitch(
                        action: true, // Initial state of the switch
                        label: 'السماح بتعديل رقم الفاتورة',
                      ),
                      const SizedBox(height: 20),
                      CustomSwitch(
                        action: true, // Initial state of the switch
                        label: 'اظهار البضاعة المدفوع لها في شاشة البيع-المرد',
                      ),
                      const SizedBox(height: 20),
                      CustomSwitch(
                        action: true, // Initial state of the switch
                        label:
                            'السماح بالتخفيض للرصيد عند تغيير سعر الصنف للعملة الأعلى',
                      ),
                      const SizedBox(height: 20),
                      CustomSwitch(
                        action: true, // Initial state of the switch
                        label: 'اظهار الكمية بالبحث في شاشة المبيعات',
                      ),
                      SizedBox(height: 20),
                      CustomSwitch(
                        action: true, // Initial state of the switch
                        label: 'اظهار المنتجات التي لها صور فقط',
                      ),
                      const SizedBox(height: 20),
                      CustomSwitch(
                        action: true, // Initial state of the switch
                        label: 'السماح ببيع المردود',
                      ),
                      const SizedBox(height: 20),
                      CustomSwitch(
                        action: true, // Initial state of the switch
                        label: 'تعديل البضاعة الاجمالي بنقر على الكمية',
                      ),
                      const SizedBox(height: 20),
                      CustomSwitch(
                        action: true, // Initial state of the switch
                        label: 'فتح إذن الصرف والاستلام المخزني',
                      ),
                      const SizedBox(height: 20),
                      CustomSwitch(
                        action: true, // Initial state of the switch
                        label:
                            'تغيير أسعار العملات الأصغر لها عند تغيير سعر العملة للعملة الأعلى',
                      ),
                      const SizedBox(height: 20),
                      CustomSwitch(
                        action: true, // Initial state of the switch
                        label:
                            'تغيير أسعار العملات الأصغر لها عند تغيير سعر العملة للعملة الأعلى',
                      ),
                      const SizedBox(height: 20),
                      CustomSwitch(
                        action: true, // Initial state of the switch
                        label: 'اظهار مورد المنتج في شاشة البيع-المرد',
                      ),
                      const SizedBox(height: 20),
                      CustomDropMenu(
                          label: 'حجم صورة المنتج في شاشة العرض',
                          items: sizePic,
                          onChanged: (value) {
                            setState(() {
                              selectedSizPic = value;
                            });
                          },
                          selectedValue: selectedSizPic),
                      const SizedBox(height: 20),
                      CustomDropMenu(
                          label: 'عدد الاعمدة في قائمة المنتجات',
                          items: number,
                          onChanged: (value) {
                            setState(() {
                              selectedNumber = value;
                            });
                          },
                          selectedValue: selectedNumber),
                      CustomSwitch(
                        action: true, // Initial state of the switch
                        label: 'اظهار محول العملات اثناء الدفع',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomSettings(label: 'التنبيه قبل الانتهاء'),
                      SizedBox(
                        height: 20,
                      ),
                      CustomSettings(label: 'التنبيه عند وصول المنتج الى'),
                      const SizedBox(height: 20),
                      CustomSwitch(
                        action: true, // Initial state of the switch
                        label: 'اظهار رسائل المساعدة',
                      ),
                      const SizedBox(height: 20),
                      CustomSwitch(
                        action: true, // Initial state of the switch
                        label: 'اغلاق الاصوات',
                      ),
                      const SizedBox(height: 20),
                      CustomSwitch(
                        action: true, // Initial state of the switch
                        label: 'اغلاق البرنامج بالبصمة',
                      ),
                    ]))));
  }
}
