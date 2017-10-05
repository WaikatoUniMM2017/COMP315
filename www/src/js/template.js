var templates = {};
var bindings = {};

templates["addPlayer"] = doT.template(
    `<form class="pure-form pure-form-aligned" id="addPlayer">
<input type="hidden" value="{{=it.id}}"/>
<legend> Add Players </legend>
 <fieldset>
        <div class="pure-control-group">
        <label for="name">*Email Address</label>
			<input type="email" name="emailAddress" required/>
			<span class="pure-form-message-inline">   This is a required field.</span>
		</div>
		<div class="pure-control-group">
			<label for="name">*Full Name</label>
			<input type="text" name=fName" required/>
			<span class="pure-form-message-inline">   This is a required field.</span>
		</div>
		<div class="pure-control-group">
		<legend> Membership Status </legend>		    
			{{ for (var value in it.accountTypes) { }}
			<div class="pure-control-group">
				<input type="radio" name="memRadio" value='{{=it.accountTypes[value].id}}'/> {{=it.accountTypes[value].name}} 
			</div>
			{{}}}
			
			<span class="pure-form-message-inline">   This is a required field.</span>
		</div>		
		<div class="pure-control-group">
			<label><input class="pure-button pure-button-primary" type="submit" value="Add"></label>
		</div>
	</fieldset>
	</form>`
);
bindings["addPlayer"] = function () {
    $("#addPlayer").submit(function (e) {
        e.preventDefault();
        window.alert("OK");

    });
};
templates["addTeam"] = doT.template(
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
			 <input type="search" name="teamMember" required />
			 <span class="pure-form-message-inline">   This is a required field.</span>
		</div>
		<div>
		<select name="select" id="selectTeamMember"> <!--Supplement an id here instead of using 'name'-->
		{{~it.players :value:index}}
             <option value="{{=value}}">{{=value}}</option>
        {{~}}          
        </select>
        <button type="button" id="addTeamMember" class="pure-button pure-button-primary">Add Team Member</button>
		</div>
		<div class="pure-control-group">
		{{~it.addedPlayers :value:index}}
             <input type="search" name="teamMember" value="{{=value}}" disabled required />
        {{~}}			
			 
		</div>
		
		
		<div class="pure-control-group">
			 <label><input class="pure-button pure-button-primary" type="submit" value="Add Team" /></label>
			 </div>
		</fieldset>
	</form>`
);

bindings["addTeam"] = function () {
    $("#addTeamMember").click(function (e) {
        e.preventDefault();
        tm = $("#selectTeamMember").val();
        addedPlayers.push(tm);
        console.log(tm);
        triggerUpdate();
    });
};


templates["newTourn"] = doT.template(
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
		 <select name="select" id="selectTeamMember" multiple="true"> <!--Supplement an id here instead of using 'name'-->
            {{~it.teams :value:index}}
                 <option value="{{=value}}">{{=value}}</option>
            {{~}}          
        </select>
		 <span class="pure-form-message-inline">   This is a required field.</span>
		</div>
		<div class="pure-control-group">
			<label><input class="pure-button pure-button-primary" type="submit" value="New Tournament" /></label>
			 </div>
		</fieldset>
	</form>`
);


templates["delTourn"] = doT.template(
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


templates["modTourn"] = doT.template(
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


templates["modTourn"] = doT.template(`{{ for(var prop in it.rounds) { }}
    <div class="pure-u-1-6 bracket" >
        {{ for(var num = 0; num < it.rounds[prop]; num++) { }}
            <div>
                <p>
                    <select>
	                        <option>{{=it.teams[num]}}</option>
	                        <option>{{=it.teams[num+1]}}</option>
                        </select>
                        </br>
                        <select>
	                        <option>{{=it.teams[num+1]}}</option>
	                        <option>{{=it.teams[num]}}</option>
                    </select>
				</p>
            </div>
        {{ } }}
    </div>    
{{ } }}
<div class="pure-u-1-4 bracket" >
        <input type="text" placeholder="WINNER!">
    </div>`);


templates["calendar"] = doT.template(`
Date: <input type="date" id="calenderDate" value="{{=it.date.toISOString().slice(0,10)}}"/> <button type="button" id="calenderButton">Submit</button> </br>
{{~getDaysInMonth(it.date.getDay(), it.date.getYear()+1900) :value:index}}
	<div class="pure-u-1-6 calenderBox">{{=value.toDateString()}}</div>
{{~}}
`);


bindings["calendar"] = function () {
    $("#calenderButton").click(function (e) {
        e.preventDefault();
        date = new Date($("#calenderDate").val());
        console.log(date);
        updateData("date", date);
    });
};

