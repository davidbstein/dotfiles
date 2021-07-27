
// initialize resizers
javascript:(function(){document.head.innerHTML += "<style> .pdfViewer.scrollHorizontal, .pdfViewer.scrollWrapped, .spread { text-align: left; } </style>";s= document.createElement("style"); p = document.getElementsByClassName('page')[0]; s.innerHTML = `.page { width: ${p.style.width}; height: ${p.style.height}; overflow: hidden !important } .canvasWrapper, .textLayer { margin-left: 0px; margin-top: 0px }`; document.head.appendChild(s); window.margin_cuts = {w: 0, h: 0, pw: parseInt(p.style.width), ph: parseInt(p.style.height)}; var [{style: page_s}, {style: content_s}] = document.styleSheets[document.styleSheets.length -1].rules; var refresh = (()=>{ page_s.setProperty("width",`${margin_cuts.pw}px`, "important");  page_s.setProperty("height", `${margin_cuts.ph}px`, "important");  content_s.setProperty("margin-left",`${margin_cuts.w}px`);  content_s.setProperty("margin-top", `${margin_cuts.h}px`);  console.log(margin_cuts, page_s, content_s); }).bind(window); delta_h = ((x) => {margin_cuts.ph+=x; margin_cuts.h+=x/2; refresh()}).bind(window); delta_w = ((x) => {margin_cuts.pw+=x; margin_cuts.w+=x/2; refresh()}).bind(window);})();

 

// reduce horizontal margins by n pixels
javascript: delta_h(-n) 
 
// reduce vertical margins by n pixels
javascript: delta_w(-n) 
 
// reset margins
javascript:(function(){window.margin_cuts = {w: 0, h: 0, pw: parseInt(p.style.width), ph: parseInt(p.style.height)};)() 
