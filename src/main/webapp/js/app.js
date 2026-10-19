function confirmDelete(message="Are you sure you want to delete this record?"){return window.confirm(message);}
function downloadCSV(tableId,fileName){
 const table=document.getElementById(tableId); if(!table)return;
 const rows=[...table.querySelectorAll("tr")];
 const csv=rows.map(row=>[...row.querySelectorAll("th,td")].map(cell=>{
   let text=cell.innerText.replace(/\r?\n|\r/g," ").trim().replace(/"/g,'""');
   return `"${text}"`;
 }).join(",")).join("\r\n");
 const blob=new Blob(["\uFEFF"+csv],{type:"text/csv;charset=utf-8;"});
 const url=URL.createObjectURL(blob), a=document.createElement("a");
 a.href=url;a.download=fileName;a.click();URL.revokeObjectURL(url);
}
function printReport(){window.print();}
