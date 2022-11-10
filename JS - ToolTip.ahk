#maxthreadsperhotkey 2

XButton1::
{
SendRaw,
(
<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Aula xx</title>
<meta charset="UTF-8">
<style></style>
<script>

</script>
</head>
<body>
</body>
</html>
)
Send, +!f
}
Return

XButton2::
js := !js
While js
{
Tooltip, document.getElementById()`ninnerHTML=`ndocument.querySelectorAll("div > *")`ndocument.getElementsByTagName("h1")`n`n<label>Nome</label>`n<input type="text">`n<input type="radio">`n<input type="number">`n<select><option></option></select>`nplaceholder=""`n`n.value`n<button id="test">`n<button onclick="mudaCor(#f00)">`n`naddEventListener("click".Função)`n`nnum.sort()`nnum.reverse()`nnum.concat()`ntoFixed() = Arredondar casas decimais`n`n.push() = Adiciona`n.unshift() = Adiciona no inicio`n.shift() = Remove o primeiro`n.pop() = Remove o último`n.splice(0.5) = Exclui a array desejada`n.slice() = Copia de A a B`n`n.toLowerCase() = Para Minúsculo`n.toUpperCase() = Para Maiúsculo`n`n<h1> a <h6> = Títulos`n<p> = Parágrafos`n<div> = Quebra de linha`n<span> = Divisões não blocantes`n<table  thead  tbody  tr  td> = TLC`n<ul> <ol> e <li> = Listas e itens de lista`n<strong> e <em> = Ênfase no texto`n<a> = Links`n`n-= CSS =-`n`nmargin = Margem externa`npadding = Margem interna`ndisplay = Posicionamento de elementos`ncursor = Tipo de cursor do mouse`nlist-style-type = Tipo de estilo <ul><li>`nwidth = Largura`nheight = Altura`n`n-= JSON =-`n`nJSON.parse(string) = String em JSON`nJSON.stringify(objeto) = JSON em String`n`nwindow.localStorage.setItem(key)`nwindow.localStorage.getItem(key)`n`n-= ATALHOS =-`n`n!{enter}`nID = div#teste`nClass = div.teste`nHome/End = Movimentação`nSelecionar Linhas = Shift + Up`nDuplicar = Shift + Alt + Down`nComentar = Ctrl + Ponto e Virgula`nEncontrar Linha = Ctrl + G`nAlinhar Código = Shift + Alt + F, 2559, 0
}
Tooltip
Return

:*:write::document.write(""){left}{left}
:*:get::document.getElementById(""){left}{left}
:*:tag::document.getElementsByTagName(""){left}{left}
:*:load::window.addEventListener("load",inicia)
:*:inner::.innerHTML=
:*:for(::for(i=0; i<p.length; i++)
:*:console::console.log(""){left}{left}