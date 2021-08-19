String selectedStatusText(int index) {
  switch(index) {
    case 0:
      return '매우 우울';
    case 1:
      return '약간 우울';
    case 2:
      return '보통';
    case 3:
      return '약간 좋음';
    case 4:
      return '아주 좋음';
    default:
      return '보통';
  }
}