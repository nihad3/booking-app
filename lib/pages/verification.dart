import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

enum VerificationStep { intro, document, selfie, processing, success }

class VerificationPage extends StatefulWidget {
  final VoidCallback onComplete;
  final VoidCallback? onSkip;

  const VerificationPage({Key? key, required this.onComplete, this.onSkip})
      : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  VerificationStep currentStep = VerificationStep.intro;
  bool documentUploaded = false;
  bool selfieUploaded = false;

  double get progress {
    switch (currentStep) {
      case VerificationStep.intro:
        return 0;
      case VerificationStep.document:
        return 0.25;
      case VerificationStep.selfie:
        return 0.5;
      case VerificationStep.processing:
        return 0.75;
      case VerificationStep.success:
        return 1.0;
    }
  }

  void handleDocumentUpload() {
    setState(() => documentUploaded = true);
    Future.delayed(const Duration(seconds: 1), () {
      setState(() => currentStep = VerificationStep.selfie);
    });
  }

  void handleSelfieUpload() {
    setState(() {
      selfieUploaded = true;
      currentStep = VerificationStep.processing;
    });
    Future.delayed(const Duration(seconds: 3), () {
      setState(() => currentStep = VerificationStep.success);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    switch (currentStep) {
      case VerificationStep.intro:
        content = _buildIntro();
        break;
      case VerificationStep.document:
        content = _buildDocumentStep();
        break;
      case VerificationStep.selfie:
        content = _buildSelfieStep();
        break;
      case VerificationStep.processing:
        content = _buildProcessing();
        break;
      case VerificationStep.success:
        content = _buildSuccess();
        break;
    }

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          _buildHeader(),
          Expanded(child: SingleChildScrollView(child: content)),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 60, 16, 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1E3A8A), Color(0xFF1E40AF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Vérification",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              Text("${(progress * 100).round()}%",
                  style: const TextStyle(color: Colors.white70)),
            ],
          ),
          const SizedBox(height: 12),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.blue[800],
            color: Colors.white,
            minHeight: 6,
          ),
        ],
      ),
    );
  }

  Widget _buildIntro() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue[100],
            child: const Icon(LucideIcons.shield, color: Colors.blue, size: 40),
          ),
          const SizedBox(height: 20),
          const Text("Vérification d'identité",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          const Text(
            "Pour garantir la sécurité de notre communauté, nous utilisons une vérification par IA. Le processus est rapide et sécurisé.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          _buildIntroFeature(
            LucideIcons.camera,
            "Photo de votre pièce d'identité",
            "Carte d'identité nationale ou passeport",
          ),
          _buildIntroFeature(
            LucideIcons.scan,
            "Selfie de vérification",
            "Notre IA analyse votre photo en temps réel",
          ),
          _buildIntroFeature(
            LucideIcons.shield,
            "100% sécurisé et confidentiel",
            "Vos données sont cryptées et protégées",
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E3A8A),
              minimumSize: const Size(double.infinity, 48),
            ),
            onPressed: () =>
                setState(() => currentStep = VerificationStep.document),
            child: const Text("Commencer la vérification"),
          ),
          if (widget.onSkip != null)
            TextButton(
              onPressed: widget.onSkip,
              child: const Text("Plus tard",
                  style: TextStyle(color: Colors.grey)),
            ),
        ],
      ),
    );
  }

  Widget _buildIntroFeature(IconData icon, String title, String desc) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.blue[50],
            child: Icon(icon, color: Colors.blue, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                Text(desc,
                    style: const TextStyle(fontSize: 13, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentStep() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Document d'identité",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          const Text("Prenez une photo claire de votre carte d'identité ou passeport.",
              style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 24),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: Colors.grey, width: 1.5)),
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: !documentUploaded
                    ? Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.blue[100],
                            child: const Icon(LucideIcons.upload,
                                color: Colors.blue, size: 32),
                          ),
                          const SizedBox(height: 16),
                          const Text("Télécharger votre document"),
                          const SizedBox(height: 8),
                          const Text("Formats acceptés : JPG, PNG, PDF",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey)),
                          const SizedBox(height: 16),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1E3A8A),
                                minimumSize: const Size(double.infinity, 44)),
                            onPressed: handleDocumentUpload,
                            icon: const Icon(LucideIcons.camera, size: 18),
                            label: const Text("Prendre une photo"),
                          ),
                          const SizedBox(height: 8),
                          OutlinedButton.icon(
                            onPressed: handleDocumentUpload,
                            icon: const Icon(LucideIcons.upload, size: 18),
                            label: const Text("Choisir un fichier"),
                          ),
                        ],
                      )
                    : Column(
                        children: const [
                          Icon(LucideIcons.checkCircle,
                              color: Colors.green, size: 64),
                          SizedBox(height: 8),
                          Text("Document téléchargé !",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600)),
                          Text("Passage à l'étape suivante...",
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelfieStep() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Photo de vérification",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          const Text(
            "Prenez un selfie pour vérifier votre identité avec notre IA.",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 24),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            color: Colors.blue[50],
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: !selfieUploaded
                    ? Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 160,
                                height: 160,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blue, width: 3, style: BorderStyle.solid),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(LucideIcons.camera,
                                    color: Colors.blue, size: 48),
                              ),
                              const Positioned(
                                child: Opacity(
                                  opacity: 0.2,
                                  child: Icon(LucideIcons.scan,
                                      size: 96, color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1E3A8A),
                                minimumSize: const Size(double.infinity, 44)),
                            onPressed: handleSelfieUpload,
                            icon: const Icon(LucideIcons.camera, size: 18),
                            label: const Text("Prendre un selfie"),
                          ),
                        ],
                      )
                    : Column(
                        children: const [
                          Icon(LucideIcons.checkCircle,
                              color: Colors.green, size: 64),
                          SizedBox(height: 8),
                          Text("Photo capturée !",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600)),
                          Text("Vérification en cours...",
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProcessing() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: const [
          SizedBox(height: 40),
          CircularProgressIndicator(color: Colors.blue),
          SizedBox(height: 24),
          Text("Vérification en cours...",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          Text("Notre IA analyse vos documents, cela ne prendra que quelques secondes.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildSuccess() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xFFD1FAE5),
            child: Icon(LucideIcons.checkCircle, color: Colors.green, size: 48),
          ),
          const SizedBox(height: 16),
          const Text("Vérification réussie !",
              style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          const Text(
            "Votre identité a été vérifiée avec succès. Vous pouvez maintenant profiter de tous les services choufDAR.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E3A8A),
              minimumSize: const Size(double.infinity, 48),
            ),
            onPressed: widget.onComplete,
            icon: const Icon(LucideIcons.shield),
            label: const Text("Continuer"),
          ),
        ],
      ),
    );
  }
}
