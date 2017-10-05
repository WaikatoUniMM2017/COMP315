var templates={};

templates["addPlayer"]=doT.template(
`<form class="pure-form pure-form-aligned">
<input type="hidden" value={{=it.id}}"}/>
<legend> Add Players </ legend>
 <fieldset>
        <div class="pure-control-group">
        <label for="name">*Email Address</label>
			<input type="email" name="emailAddress" required/>
			<span class="pure-form-message-inline">   This is a required field.</span>
		</div>
		<div class="pure-control-group">
			<label for="name">*Full Name</label>
			<input type="text" name"fName" required/>
			<span class="pure-form-message-inline">   This is a required field.</span>
		</div>
		<div class="pure-control-group">
		<legend> Membership Status </legend>
			{{~it.type.split(',') :value:index}}
			<div class="pure-control-group">
				<input type="radio" name="memRadio"{{=value}}/> {{=value}} 
			</div>
			{{~}}
			<span class="pure-form-message-inline">   This is a required field.</span>
		</div>
		<div class="pure-control-group">
			<label for="name">Team Name</label>
			<input type="search" name ="teamName"/>
		</div>
		<div class="pure-control-group">
			<label><input class="pure-button pure-button-primary" type="submit" value="Add"></label>
		</div>
	</fieldset>
	</form>`
	);

templates["addTeam"]=doT.template(
`<form class="pure-form pure-form-aligned">
<input type="hidden" value={{=it.id}}"}/>
<legend> Add Teams </legend>
	<fieldset>
        <div class="pure-control-group">
        	<label for="name">*Team Name</label>
			<input type="text" name=teamName" required />
			<span class="pure-form-message-inline">   This is a required field.</span>
		</div>
		<div class="pure-control-group">
			<label for="name">*Team Member</label>
			 <input type="search" name="teamMember required />
			 <span class="pure-form-message-inline">   This is a required field.</span>
		</div>
		<div class="pure-control-group">
			 <label><input class="pure-button pure-button-primary" type="submit" value="Add" /></label>
			 </div>
		</fieldset>
	</form>`
	);

templates["newTourn"]=doT.template(
`<form class="pure-form pure-form-aligned">
<input type="hidden" value={{=it.id}}"}/>
<legend> New Tournament </legend>
	<fieldset>
        <div class="pure-control-group">
        	<label for="name">*Game Title</label>
			<input type="text" name=gameName" required />
			<span class="pure-form-message-inline">   This is a required field.</span>
		</div>
		 <div class="pure-control-group">
        	<label for="name">*Date and Time: From</label>
        	<input type="datetime-local" name=datentimeFrom" required />
        	<span class="pure-form-message-inline">   This is a required field.</span>
		</div>
		 <div class="pure-control-group">
		 	<label for="name">*Date and Time: To</label>
			<input type="datetime-local" name=datentimeTo" required />
			<span class="pure-form-message-inline">   This is a required field.</span>
		</div>
		 <div class="pure-control-group">
			<label for="name">*Venue</label>
			<input type="text" name=venue"required />
			<span class="pure-form-message-inline">   This is a required field.</span>
		</div>
		 <div class="pure-control-group">
		 <label for="name">Add comment</label>
			 <textarea name="comment"> </textarea>
		</div>
		 <div class="pure-control-group">
		 <label for="name">*Participated Teams</label>
		 <input type="search" name=participateTeams" required />
		 <span class="pure-form-message-inline">   This is a required field.</span>
		</div>
		<div class="pure-control-group">
			<label><input class="pure-button pure-button-primary" type="submit" value="Set Bracket" /></label>
			 </div>
		</fieldset>
	</form>`
	);


templates["delTourn"]=doT.template(
`<form class="pure-form pure-form-aligned">
<input type="hidden" value={{=it.id}}"}/>
<legend> Delete Tournament </legend>
	<fieldset>
        <div class="pure-control-group">
	        <label for="name">*Delete</label>
			<input type="search" placeholder="search" name=delTourney" required /> 
			<span class="pure-form-message-inline">   This is a required field.</span>
		</div>	
 <div class="pure-controls">
	     <legend>At the same time, would you also want to:</legend>
	     <div class="pure-control-group">
		   	 <label for="name">Delete related teams</label>
			 <input type="checkbox" name="delstat" value="Delteams" />
		</div>
		<div class="pure-control-group">
			 <label for="name">Delete related teams and players</label>
			 <input type="checkbox" name="delstat" value="Deltandp" />
		</div>
		<div class="pure-control-group">
			 <label for="name">Notify players by email</label>
			 <input type="checkbox" name="delstat" value="notifyp" />
		</div>
		
</div>
<div class="pure-control-group">
	<label><input class="pure-button pure-button-primary" type="submit" value="Delete"></label>	
</div>
</fieldset>
</form>`
);


templates["modTourn"]=doT.template(
`<form class="pure-form pure-form-aligned">
<input type="hidden" value={{=it.id}}"}/>
	<legend> Modify Tournament </legend>
	<fieldset>
	<div class="pure-control-group">
		<label for="name">*Search tounament </label>
		<input type="search" name=searchTourney" required />
		<span class="pure-form-message-inline">   This is a required field.</span>
	</div>
        <div class="pure-control-group">
        	<label for="name">*Game Title</label>
			<input type="text" name=gameName" required />
			<span class="pure-form-message-inline">   This is a required field.</span>
		</div>
		 <div class="pure-control-group">
        	<label for="name">*Date and Time: From</label>
        	<input type="datetime-local" name=datentimeFrom" required />
        	<span class="pure-form-message-inline">   This is a required field.</span>
		</div>
		 <div class="pure-control-group">
		 	<label for="name">*Date and Time: To</label>
			<input type="datetime-local" name=datentimeTo" required />
			<span class="pure-form-message-inline">   This is a required field.</span>
		</div>
		 <div class="pure-control-group">
			<label for="name">*Venue</label>
			<input type="text" name=venue"required />
			<span class="pure-form-message-inline">   This is a required field.</span>
		</div>
		 <div class="pure-control-group">
		 <label for="name">Add comment</label>
			 <textarea name="comment"> </textarea>
		</div>
		 <div class="pure-control-group">
		 <label for="name">*Participated Teams</label>
		 <input type="search" name=participateTeams" required />
		 <span class="pure-form-message-inline">   This is a required field.</span>
		</div>
		<div class="pure-control-group">
			<label><input class="pure-button pure-button-primary" type="submit" value="Set Bracket" /></label>
			 </div>
		</fieldset>
	</form>`

);





