import QtQuick 2.9
import QtQml.Models 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 2.0 as PlasmaComponents

Rectangle {
    id: dashdelegteType
    height: units.gridUnit * 8
    width: cbwidth
    color: theme.backgroundColor
    property alias dashnewsLmodel: dashnewsListModel
    property alias dashweatherLmodel: dashweatherListModel

    Component.onCompleted: {
        console.log(iType, iObj)
        filterSwitchDash(iType, iObj)
    }

    function filterSwitchDash(iType, iObj){
        switch(iType){
            case "DashNews":
                console.log("here1")
                filterDashNewsObj(iObj)
                break
            case "DashWeather":
                console.log("here2")
                filterDashWeatherObj(iObj)
                break
        }
    }

    function filterDashWeatherObj(weatherobj){
          if(weatherobj){
              var filteredWeatherObject = JSON.parse(weatherobj)
              dashdelegatelview.model = dashweatherLmodel
              dashweatherLmodel.append({itemType: "DashWeather", itemWeatherTemp: filteredWeatherObject.main.temp, itemWeatherTempMin: filteredWeatherObject.main.temp_min, itemWeatherTempMax: filteredWeatherObject.main.temp_max, itemWeatherTempType: filteredWeatherObject.weather[0].main})
              console.log("here3")
          }
    }

    function filterDashNewsObj(newsobj){
            if(newsobj){
              var filteredNewsObject = JSON.parse(newsobj)
              for (var i=0; i<filteredNewsObject.totalResults; i++){
                  dashdelegatelview.model = dashnewsLmodel
                  dashnewsLmodel.append({itemType: "DashNews", newsSource: filteredNewsObject.articles[i].source.name, newsTitle: filteredNewsObject.articles[i].title, newsDescription: filteredNewsObject.articles[i].description, newsURL: filteredNewsObject.articles[i].url, newsImgURL: filteredNewsObject.articles[i].urlToImage})
              }
              console.log("here4")
            }
          }

ListModel {
        id: dashnewsListModel
    }

ListModel {
        id: dashweatherListModel
    }

ListView {
     id: dashdelegatelview
     width: cbwidth
     spacing: 4
     focus: false
     interactive: true
     clip: true;
     delegate: Component{
               Loader{
                source: switch(itemType){
                               case "DashNews": return "DashNewsDelegate.qml"
                               case "DashWeather": return "DashWeatherDelegate.qml"
                }
            }
        }

     onCountChanged: {
         var root = dashdelegatelview.visibleChildren[0]
         var listViewHeight = 0
         var listViewWidth = 0

         for (var i = 0; i < root.visibleChildren.length; i++) {
             listViewHeight += root.visibleChildren[i].height
             listViewWidth  = Math.max(listViewWidth, root.visibleChildren[i].width)
         }
         console.log(listViewHeight)
         dashdelegatelview.height = listViewHeight + units.gridUnit * 2
     }
   }
}

