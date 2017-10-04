var templates={};

templates["addPlayer"]=doT.template(
`<label>input type="email" required/></label>
<label><input type="text" required/></label>
{{~it.type :value:index}}
<label><input type="radio" name="memradio"{{=value}}/>{{=value}} </label>
{{~}}
<label><input type="search" /></label>
<label><input type="submit" value="Add"></label>`
);

templates["addTeam"]=doT.template(
`<label><input type="text" required ></label>
 <label><input type="search" required></label>
 <label><input type="submit" value="Add"></label>`
);

templates["newTourn"]=doT.template(
`<label><input type="text" required /></label>
<label><input type="datetime-local" required /></label>
<label><input type="datetime-local" required /></label>
<label><input type="text" required /></label>
 <label><textarea name="comment"> </textarea></label>
<label><input type="search" required />
<label><input type="submit" value="Set Bracket" /></label>`
);


templates["delTourn"]=doT.template(
`<form>
	<label><input type="search" placeholder="search" required /> </label>
	<fieldset>
	    <label><legend>At the same time, would you also want to:</legend></label>
		<input type="checkbox" name="delstat" value="Delteams" /> 
		<input type="checkbox" name="delstat" value="Deltandp" />   
		<input type="checkbox" name="delstat" value="notifyp" />   
	</fieldset>
	<label><input type="submit" value="Delete"></label>	
</form>`
);


templates["modTourn"]=doT.template(
`<label><input type="search" required /></label>
<label><input type="datetime-local" required /></label>
<label><input type="datetime-local" required /></label>
<label><input type="text" required /></label>
<label><textarea name="comment" ></textarea></label>
<label><input type="search" required/></label>`

);





