(function(a){a.jgrid={};a.jgrid.defaults={recordtext:"Række(r)",loadtext:"Indlæser...",pgtext:"/"};a.jgrid.search={caption:"Søg...",Find:"Find",Reset:"Nulstil",odata:["lig med","forskellig fra","mindre end","mindre end eller lig med","større end"," større end eller lig med","starter med","slutter med","indeholder"]};a.jgrid.edit={addCaption:"Tilføj",editCaption:"Ret",bSubmit:"Send",bCancel:"Annuller",bClose:"Luk",processData:"Behandler...",msg:{required:"Felt er nødvendigt",number:"Indtast venligst et validt tal",minValue:"værdi skal være større end eller lig med",maxValue:"værdi skal være mindre end eller lig med",email:"er ikke en valid email",integer:"Indtast venligst et validt heltalt",date:"Indtast venligst en valid datoværdi"}};a.jgrid.del={caption:"Slet",msg:"Slet valgte række(r)?",bSubmit:"Slet",bCancel:"Annuller",processData:"Behandler..."};a.jgrid.nav={edittext:" ",edittitle:"Rediger valgte række",addtext:" ",addtitle:"Tilføj ny række",deltext:" ",deltitle:"Slet valgte række",searchtext:" ",searchtitle:"Find poster",refreshtext:"",refreshtitle:"Indlæs igen",alertcap:"Advarsel",alerttext:"Vælg venligst række"};a.jgrid.col={caption:"Vis/skjul kolonner",bSubmit:"Send",bCancel:"Annuller"};a.jgrid.errors={errcap:"Fejl",nourl:"Ingel url valgt",norecords:"Ingen poster at behandle",model:"colNames og colModel har ikke samme længde!"};a.jgrid.formatter={integer:{thousandsSeparator:" ",defaulValue:0},number:{decimalSeparator:",",thousandsSeparator:" ",decimalPlaces:2,defaulValue:0},currency:{decimalSeparator:",",thousandsSeparator:" ",decimalPlaces:2,prefix:"",suffix:"",defaulValue:0},date:{dayNames:["Søn","Man","Tirs","Ons","Tors","Fre","Lør","Søndag","Mandag","Tirsdag","Onsdag","Torsdag","Fredag","Lørdag"],monthNames:["Jan","Feb","Mar","Apr","Maj","Jun","Jul","Aug","Sep","Okt","Nov","Dec","Januar","Februar","Marts","April","Maj","Juni","Juli","August","September","Oktober","November","December"],AmPm:["","","",""],S:function(b){return"."},srcformat:"Y-m-d",newformat:"d/m/Y",masks:{ISO8601Long:"Y-m-d H:i:s",ISO8601Short:"Y-m-d",ShortDate:"j/n/Y",LongDate:"l d. F Y",FullDateTime:"l d F Y G:i:s",MonthDay:"d. F",ShortTime:"G:i",LongTime:"G:i:s",SortableDateTime:"Y-m-d\\TH:i:s",UniversalSortableDateTime:"Y-m-d H:i:sO",YearMonth:"F Y"},reformatAfterEdit:false},baseLinkUrl:"",showAction:"show"}})(jQuery);