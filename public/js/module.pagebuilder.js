// ######### MAIN CLASS #########
class PageBuilder {
  constructor(templates, grid) {
    this.grid = grid;
    this.templates = templates;
  }

  addBlock(template, uniqid=false, autoPosition = true) {
    if(uniqid==false) uniqid = template.id+'.'+(new Date().getTime() + Math.floor((Math.random()*10000)+1)).toString(16);
    var content = '<div class="grid-stack-item">'+template.content+'</div>';
    var content = content.replace(/{{widget.id}}/g, uniqid);
    var el = $.parseHTML(content);
    if(!template.x) template.x = 0;
    if(!template.y) template.y = 0;
    var w = this.grid.addWidget(el, template.x, template.y, template.width, template.height, autoPosition, 0, 12, 0, 12, uniqid);
    grid.resizable('.grid-stack-item', false);
  }

  getBlock(id) {
    var r = '';
    $.each(this.templates, function(k,v) {
      if(id == k) r = v;
    });
    return r;
  }
}

// ######### INITIALISATION #########
$('.grid-stack').gridstack();
var grid = $('.grid-stack').data('gridstack');
var pageBuilder = new PageBuilder(templates, grid);
$.each(blocks, function(k,v) {
  pageBuilder.addBlock({
    content : v.content,
    width : v.width,
    height : v.height,
    x : v.x,
    y : v.y,
  },k,false);
});

// ######### TRIGGER #########
$('.remove').click(function(){
  el = $(this).closest('.grid-stack-item')
  grid.remove_widget(el);
});
$('#FormAddBlock').submit(function() {
  var template = pageBuilder.getBlock($('#FormAddBlock select').val());
  pageBuilder.addBlock(template);
  return false;
});
$('#FormUpdatePage').submit(function() {
  var items = [];

  $('.grid-stack-item.ui-draggable').each(function () {
    $('#FormUpdatePage').append('<input type="hidden" name="'+$(this).attr('data-gs-id')+'.x" value="'+$(this).attr('data-gs-x')+'" /> ');
    $('#FormUpdatePage').append('<input type="hidden" name="'+$(this).attr('data-gs-id')+'.y" value="'+$(this).attr('data-gs-y')+'" /> ');
  });

  return true;
});
