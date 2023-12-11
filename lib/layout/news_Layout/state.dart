abstract class stateNews {}
class initailState extends stateNews{}
class navParState extends stateNews{}
class getDataBisnessSucces extends stateNews{}
class getDataBisnessError extends stateNews{
  final String Error;

  getDataBisnessError(this.Error);
}
class getDataBisnessLoding extends stateNews{}
class getDataSportsSucces extends stateNews{}
class getDataSportsError extends stateNews{
  final String Error;

  getDataSportsError(this.Error);


}
class getDataSportsLoding extends stateNews{}
class getDataScienecSucces extends stateNews{}
class getDataScienceError extends stateNews{
  final String Error;

  getDataScienceError(this.Error);


}
class getDataScienceLoding extends stateNews{}
class changeMoodState extends stateNews{}
class getDataSearchSucces extends stateNews{}
class getDataSearchError extends stateNews{
  final String Error;

  getDataSearchError(this.Error);



}
class getDataSearchLoding extends stateNews{}
