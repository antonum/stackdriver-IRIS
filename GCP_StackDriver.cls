Class GCP.StackDriver Extends %RegisteredObject
{
ClassMethod Dashboard() as %String {
  set ts=$zdt($h) //capture timestamp
  set dashboard = ##class(SYS.Stats.Dashboard).Sample()
  do ##class(%ZEN.Auxiliary.jsonProvider).%WriteJSONStreamFromObject(.stream,dashboard)
  //w stream.Read() //test/debug only
  set obj={}.%FromJSON(stream.Read())
  do obj.%Set("TimeStamp",ts,"string") //insert timestamp into json
  quit obj.%ToJSON() 
}
ClassMethod DashboardToFile(filename="dashboard.log") {
    set file=##class(%Stream.FileCharacter).%New()
	set sc=file.LinkToFile(filename)
	//set sc=file.MoveToEnd()
	set sc=file.Clear()	
	set sc=file.WriteLine(..Dashboard())
	set sc=file.%Save()
	quit sc 
}
} 
