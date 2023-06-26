

class UpdateWorkEmailRequest {
  bool isReceiptOnWorkEmail;
  String workEmail;
  String userId;

  UpdateWorkEmailRequest({
    required this.isReceiptOnWorkEmail,
    required this.workEmail,
    required this.userId,
  });

}