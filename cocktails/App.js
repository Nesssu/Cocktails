import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View } from 'react-native';

export default function App() {
  return (
    <View style={styles.App}>
      
      {/* The Favourite button */}
      <View style={styles.Favourites}>Favourites</View>

      {/* The Favourite button */}


      {/* The Favourite button */}


      {/* The Favourite button */}
      
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  App: {
    display: 'flex',
    alignItems: 'center',
    width: '100%',
    height: '100%',
    backgroundColor: "white",
    padding: "10px"
  },
  Favourites: {
    width: '90%',
    height: "40px",
    borderColor: "green",
    backgroundColor: "green",
    color: "white",
    borderRadius: "20px",
    borderWidth: "thin",
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    shadowColor: "#888",
    shadowOpacity: "1",
    shadowOffset: {width: 0, height: 0},
    shadowRadius: "5px",
  }
});
