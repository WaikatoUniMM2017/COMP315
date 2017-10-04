$(document).ready(function(){
	$(window).bind( 'hashchange', onHashChange );		
		// $( "#div.foo" ).click(function() {
  // $( "span", this ).addClass( "bar" );
// });
console.info("READY");
});

function onHashChange(e) {
    console.debug("Hash changed to: " + window.location.hash);
    var hash = $.uriAnchor.makeAnchorMap();
    console.debug(hash);

    switch (hash.page){
        default:
            getSection().html(
                templates[hash.page](hash)+"<!--"+hash.page+"-->"
            );
            try{
                //bindings[hash.page]();
            } catch (ex){}
            break;
    }
};

function deleteField(field) {
    var hash = $.uriAnchor.makeAnchorMap();
    delete hash[field];
    $.uriAnchor.setAnchor(hash);
}

function updatePage(page) {
    var hash = $.uriAnchor.makeAnchorMap();
    hash.page = page;
    $.uriAnchor.setAnchor(hash);
}

function updateData(field, data) {
    var hash = $.uriAnchor.makeAnchorMap();
    hash[field] = data;
    $.uriAnchor.setAnchor(hash);
}

function getData(field) {
    return $.uriAnchor.makeAnchorMap()[field];
}
//Shorthand method to get the main section
function getSection() {
    return $("#sectionMain");
}
	