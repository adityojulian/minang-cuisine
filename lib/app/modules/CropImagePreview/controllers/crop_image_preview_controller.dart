import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class CropImagePreviewController extends GetxController {
  String imagePath = Get.arguments;

  String scannedText = "";
  bool textScanning = false;
  List<String> barcodeList = [];

  Future<void> scanImage(String imageSource) async {
    print("masuk scan bang");
    textScanning = true;

    final inputImage = InputImage.fromFilePath(imageSource);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognizedText = await textDetector.processImage(inputImage);
    await textDetector.close();

    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        barcodeList.add(line.elements.first.text);
        scannedText = scannedText + line.elements.first.text + "\n";
      }
    }
    print("scannedText: " + scannedText);
    print("barcode list " + barcodeList.toString());
    textScanning = false;
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    await scanImage(imagePath);
  }
}
