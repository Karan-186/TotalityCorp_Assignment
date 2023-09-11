import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ScrollView(showsIndicators: false){
            Text("Play")
                .font(.title)
            CardView()
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
