jQuery(function($){
  d = new Date();
  dd = (d.getDate() < 10) ? '0' + d.getDate() : d.getDate();
  mm = (d.getMonth() < 10) ? '0' + (d.getMonth() + 1) : d.getMonth() + 1;
  yy = d.getFullYear() + 543; // Change to B.E.
  today = dd + '/' + mm + '/' + yy;

  // Datepicker
  $("#address_bdate").datepicker({
    changeMonth: true,
    changeYear: true,
    dateFormat: 'dd/mm/yy',
    defaultDate: today,
    yearOffset: 543,
    dayNames: ['อาทิตย์','จันทร์','อังคาร','พุธ','พฤหัสบดี','ศุกร์','เสาร์'],
    dayNamesMin: ['อา.','จ.','อ.','พ.','พฤ.','ศ.','ส.'],
    monthNames: ['มกราคม','กุมภาพันธ์','มีนาคม','เมษายน','พฤษภาคม','มิถุนายน','กรกฎาคม','สิงหาคม','กันยายน','ตุลาคม','พฤศจิกายน','ธันวาคม'],
    monthNamesShort: ['ม.ค.','ก.พ.','มี.ค.','เม.ย.','พ.ค.','มิ.ย.','ก.ค.','ส.ค.','ก.ย.','ต.ค.','พ.ย.','ธ.ค.']
  });
});
