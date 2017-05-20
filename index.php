<?php include 'header.php';?>
<?php include 'first.php';?>
<div class="main">
	<div class="half1">
		<div class="inside">
			<div class="razmerje">
				<div class="title">
					RAZMERJE MED IZVEDBO IN VSEBINO
				</div>
				<div class="top" style="margin-bottom:-8px; color:#f0ad4e; font-weight:bold;">
					<div class="cell">IZVEDBA</div>
					<div class="cell">VSEBINA</div>
				</div>
				<div class="slider">
					<input id="razmerje" name="razmerje" type="range" min="0" max="100" value="50" step="1" onchange="sendVal()">
				</div>
			</div>
			<br />
			<br />

			<div class="showable">
				<button id="prva_polovica_btn" style="float:left;" class="btn btn-info" data-toggle="collapse" onclick="prikaz('prva_polovica')">Izvedba</button>
				<button id="druga_polovica_btn" style="float:right;" class="btn btn-info" data-toggle="collapse" onclick="prikaz('druga_polovica')">Vsebina</button>
				<div style="clear:both; float:none;"></div>
			</div>
			<div style="padding-top:10px;"></div>
			
			<div class="top">
				<div class="cell">NE</div>
				<div class="cell">?</div>
				<div class="cell">DA</div>
			</div>

			<div id="prva_polovica">
				<?php for ($i = 0; $i < count($znacke_izvedba); $i++):?>
				<div id="first" class="one">
					<div class="title">
						<?php echo $znacke_izvedba[$i];?>
					</div>
					<div class="slider">
						<input id="zastavica_izvedba<?php echo $i;?>" type="range" min="-1" max="1" value="0" step="1" onchange="sendVal()">
					</div>
				</div>
				<?php endfor;?>
			</div>

			<div id="druga_polovica">
				<?php for ($i = 0; $i < count($znacke_vsebina); $i++):?>
				<div id="first" class="one">
					<div class="title">
						<?php echo $znacke_vsebina[$i];?>
					</div>
					<div class="slider">
						<input id="zastavica_vsebina<?php echo $i;?>" type="range" min="-1" max="1" value="0" step="1" onchange="sendVal()">
					</div>
				</div>
				<?php endfor;?>
			</div>

		</div>
	</div>
	<div class="line"></div>
	<div class="half2" id="half2">
		<div class="inside" id="inside">
			<?php 
			foreach ($podatki as $predmet_id => $predmet_data):?>
			<div class="one" id="predmet<?php echo $predmet_id;?>">
				<div class="sum"></div>
				<a class="tit" href="<?php echo $predmet_data['predmet_link'];?>" target="_blank"><?php echo $predmet_data['naziv']?></a>
				<h3>Modul: <?php echo $predmet_data['modul'];?></h3>
				<h3>Nosilec: <a target="_blank" href="<?php echo $predmet_data['nosilec_link'];?>"><?php echo $predmet_data['nosilec'];?></a></h3>
				<h4 style="font-size:16px; margin-bottom:1px;">Zadovoljstvo: </h4>
				<div class="progress" style="display:inline-block; width:80%;">
					<div class="progress-bar" role="progressbar" aria-valuenow="<?php echo $predmet_data['kvaliteta']?>" aria-valuemin="0" aria-valuemax="100" style="width:<?php echo $predmet_data['kvaliteta']?>%"></div>
				</div>
				<div style="display:inline;"><?php echo $predmet_data['kvaliteta']?>%</div>
				<div class="zastavice">
					<?php foreach ($predmet_data['znacke'] as $zastavica):?>
						<div class="flag">
							<?php echo $zastavica;?>
						</div>
					<?php endforeach;?>
				</div>
			</div>			
			<?php endforeach;?>
		</div>
	</div>

</div>
<?php include 'footer.php';?>