//
//  HomeTopScreen.swift
//  BookViewer
//
//  Created by Роман on 06.08.2023.
//

import SwiftUI

struct HomeTopScreen: View {
    
    @State private var selectTop = 1
    
    let topCards5: [Card] = [
        Card(image: "https://images.unsplash.com/photo-1567095761054-7a02e69e5c43?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80", title: "Fire and Ice. Robert Frost", price: "free", rating: "4.9", details: "Author: Robert Frost", text: "Some say the world will end in fire, Some say in ice. From what I’ve tasted of desire I hold with those who favor fire. But if it had to perish twice, I think I know enough of hate To know that for destruction ice Is also great, And would suffice.", isPurchased: false),
        
        Card(image: "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/1c027a60064219.5a3a592bc4b59.png", title: "Ozymandias. Percy Shelley", price: "free", rating: "4.9", details: "Author: Percey Shelley", text: "I met a traveller from an antique land Who said: ‘Two vast and trunkless legs of stone Stand in the desert. Near them, on the sand, Half sunk, a shattered visage lies, whose frown, And wrinkled lip, and sneer of cold command, Tell that its sculptor well those passions read Which yet survive, stamped on these lifeless things, The hand that mocked them and the heart that fed. And on the pedestal these words appear — My name is Ozymandias, king of kings: Look on my works, ye Mighty, and despair! Nothing beside remains. Round the decay Of that colossal wreck, boundless and bare The lone and level sands stretch far away.", isPurchased: false),
        
        Card(image: "https://m.media-amazon.com/images/I/51UbF9rrqQL._SX333_BO1,204,203,200_.jpg", title: "No Man Is An Island. John Donne", price: "free", rating: "4.8", details: "Author: John Donne", text: "No man is an island, Entire of itself, Every man is a piece of the continent, A part of the main. If a clod be washed away by the sea, Europe is the less. As well as if a promontory were. As well as if a manor of thy friend’s Or of thine own were: Any man’s death diminishes me, Because I am involved in mankind, And therefore never send to know for whom the bell tolls; It tolls for thee.", isPurchased: false),
        
        Card(image: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Taras_Shevchenko_-_portrait_by_Ivan_Kramskoi.jpg/939px-Taras_Shevchenko_-_portrait_by_Ivan_Kramskoi.jpg", title: "The Thought. Taras Shevchecnko", price: "free", rating: "4.2", details: "Some details", text: "Water flows into the blue sea, It doesn't leak The Cossack is looking for his destiny, And there is no fate. The Cossack died before his eyes; The blue sea plays Cossack heart plays And the thought says: Where are you going without asking? To whom he left Father, old woman, A young girl? The wrong people are in a foreign country — It's hard to live with them! No one to cry with No talk. A Cossack is sitting on that side, The blue sea is playing. I thought fate would meet — There was grief. And cranes fly to themselves Home keys. The Cossack cries - beaten paths Overgrown with thorns.", isPurchased: false),
        
        Card(image: "https://www.familius.com/wp-content/uploads/1660/88/9781641705721_3D-931x1024.png", title: "Stopping by Woods on a Snowy Evening. Robert Frost", price: "free", rating: "4.6", details: "Author: Robert Frost", text: "Whose woods these are I think I know. His house is in the village though; He will not see me stopping here To watch his woods fill up with snow. My little horse must think it queer To stop without a farmhouse near Between the woods and frozen lake The darkest evening of the year. He gives his harness bells a shake To ask if there is some mistake. The only other sound’s the sweep Of easy wind and downy flake. The woods are lovely, dark and deep, But I have promises to keep, And miles to go before I sleep, And miles to go before I sleep.", isPurchased: false)
    ]
    
    let topCards8: [Card] = [
        Card(image: "https://images.unsplash.com/photo-1567095761054-7a02e69e5c43?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80", title: "Fire and Ice. Robert Frost", price: "free", rating: "4.9", details: "Author: Robert Frost", text: "Some say the world will end in fire, Some say in ice. From what I’ve tasted of desire I hold with those who favor fire. But if it had to perish twice, I think I know enough of hate To know that for destruction ice Is also great, And would suffice.", isPurchased: false),
        
        Card(image: "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/1c027a60064219.5a3a592bc4b59.png", title: "Ozymandias. Percy Shelley", price: "free", rating: "4.9", details: "Author: Percey Shelley", text: "I met a traveller from an antique land Who said: ‘Two vast and trunkless legs of stone Stand in the desert. Near them, on the sand, Half sunk, a shattered visage lies, whose frown, And wrinkled lip, and sneer of cold command, Tell that its sculptor well those passions read Which yet survive, stamped on these lifeless things, The hand that mocked them and the heart that fed. And on the pedestal these words appear — My name is Ozymandias, king of kings: Look on my works, ye Mighty, and despair! Nothing beside remains. Round the decay Of that colossal wreck, boundless and bare The lone and level sands stretch far away.", isPurchased: false),
        
        Card(image: "https://m.media-amazon.com/images/I/51UbF9rrqQL._SX333_BO1,204,203,200_.jpg", title: "No Man Is An Island. John Donne", price: "free", rating: "4.8", details: "Author: John Donne", text: "No man is an island, Entire of itself, Every man is a piece of the continent, A part of the main. If a clod be washed away by the sea, Europe is the less. As well as if a promontory were. As well as if a manor of thy friend’s Or of thine own were: Any man’s death diminishes me, Because I am involved in mankind, And therefore never send to know for whom the bell tolls; It tolls for thee.", isPurchased: false),
        
        Card(image: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Taras_Shevchenko_-_portrait_by_Ivan_Kramskoi.jpg/939px-Taras_Shevchenko_-_portrait_by_Ivan_Kramskoi.jpg", title: "The Thought. Taras Shevchecnko", price: "free", rating: "4.8", details: "Some details", text: "Water flows into the blue sea, It doesn't leak The Cossack is looking for his destiny, And there is no fate. The Cossack died before his eyes; The blue sea plays Cossack heart plays And the thought says: Where are you going without asking? To whom he left Father, old woman, A young girl? The wrong people are in a foreign country — It's hard to live with them! No one to cry with No talk. A Cossack is sitting on that side, The blue sea is playing. I thought fate would meet — There was grief. And cranes fly to themselves Home keys. The Cossack cries - beaten paths Overgrown with thorns.", isPurchased: false),
        
        Card(image: "https://www.familius.com/wp-content/uploads/1660/88/9781641705721_3D-931x1024.png", title: "Stopping by Woods on a Snowy Evening. Robert Frost", price: "free", rating: "4.6", details: "Author: Robert Frost", text: "Whose woods these are I think I know. His house is in the village though; He will not see me stopping here To watch his woods fill up with snow. My little horse must think it queer To stop without a farmhouse near Between the woods and frozen lake The darkest evening of the year. He gives his harness bells a shake To ask if there is some mistake. The only other sound’s the sweep Of easy wind and downy flake. The woods are lovely, dark and deep, But I have promises to keep, And miles to go before I sleep, And miles to go before I sleep.", isPurchased: false),
        
        Card(image: "https://cdn11.bigcommerce.com/s-83t5jdek/images/stencil/1280x1280/products/11088/88959/LOROCA018_low-res_v8_UF__92366.1654080991.jpg?c=2", title: "Still I Rise. Maya Angelou", price: "free", rating: "4.6", details: "Author: Maya Angelou", text: "You may write me down in history With your bitter, twisted lies, You may tread me in the very dirt But still, like dust, I’ll rise. Does my sassiness upset you? Why are you beset with gloom? ’Cause I walk like I’ve got oil wells Pumping in my living room. Just like moons and like suns, With the certainty of tides, Just like hopes springing high, Still I’ll rise. Did you want to see me broken? Bowed head and lowered eyes? Shoulders falling down like teardrops. Weakened by my soulful cries. Does my haughtiness offend you? Don’t you take it awful hard ’Cause I laugh like I’ve got gold mines Diggin’ in my own back yard. You may shoot me with your words, You may cut me with your eyes, You may kill me with your hatefulness, But still, like air, I’ll rise. Does my sexiness upset you? Does it come as a surprise That I dance like I’ve got diamonds At the meeting of my thighs? Out of the huts of history’s shame I rise Up from a past that’s rooted in pain I rise I’m a black ocean, leaping and wide, Welling and swelling I bear in the tide. Leaving behind nights of terror and fear I rise Into a daybreak that’s wondrously clear I rise Bringing the gifts that my ancestors gave, I am the dream and the hope of the slave. I rise I rise I rise.", isPurchased: false),
        
        Card(image: "https://folio.com.ua/system/books/covers/000/002/167/large/%D0%A2_%D0%A8%D0%B5%D0%B2%D1%87%D0%B5%D0%BD%D0%BA%D0%BE_%D0%97%D0%B0%D0%BF%D0%BE%D0%B2%D1%96%D1%82.png?1619707578", title: "The testament. Taras Shevchenko", price: "free", rating: "4.6", details: "Some details", text: "When I die, bury me Me on the grave Among the wide steppe Dear Ukraine, So that the roes are wide-field, And the Dnipro, and steep It was visible, it was heard How roaring roars. As it will carry from Ukraine In the blue sea Blood of the enemy... go away And meadows and mountains - I will leave everything, and I will go away To God himself To pray... and besides I don't know God. Bury and rise Break the shackles And with impressive evil blood Sprinkle the will. And I'm in a big family, Free, new in the family, Don't forget to mention In a nice quiet word.", isPurchased: false),
        
        Card(image: "https://st.violity.com/auction/big/auctions/14/77/87/9/147787956.jpg", title: "The Poplar. Taras Shevchecnko", price: "free", rating: "4.4", details: "Some details", text: "The wind howls on the forest floor, Walking in the field The edge of the road bends a poplar All the way down. The condition is high, the leaf is wide Useless turns green. All around the field is like the sea Wide, blue. Chumak is coming, look And he bows his head, A shepherd in the morning with a pipe Sitting on the grave Take a look - your heart aches: There's nothing around. Alone, alone, like an orphan In a foreign country, perish! Who loved thin, flexible To die in the steppe? Hold on - I'll tell you everything. Listen, girls! Loved black eyebrows Cossack girl. I fell in love - I didn't stop: He went and died... If she knew what she would leave — I would not love; If I knew that I would die - It would not have been allowed; If I had known, I would not have gone Late for water I wouldn't stay up until midnight /114/ With the lovely one under the willow tree. If only I knew!.. And that disaster - Ahead to know What will happen to us in the world... Don't know, girls! Do not ask your fate!.. The heart itself knows Who loves let it wither While buried Not for long, black-browed! Brown eyes, The white face turns red - Not long, girls! By noon, and it will wither, Eyebrows fade. Make love, make love As he knows by heart. Chirping nightingale In the meadow on the viburnum, The little goat sings, Walking in the valley. Sings until it comes out Chornobriva from the house, And he will ask her Wasn't the mother Stand up for themselves, hug each other - The nightingale sings; They will listen, disperse Both are good... No one will see it No one asks: Where have you been, what have you been doing? She knows herself... Loved, loved And my heart ached - My heart felt a little, Can't tell.", isPurchased: false)
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Show in")
                Spacer()
                Picker(selection: $selectTop, label: Text("Top 8")) {
                    Text("Top 5").tag(1)
                    Text("Top 8").tag(2)
                }
                .accentColor(.orange)
            }
            .padding()
            
            switch selectTop {
            case 1:
                CardsDoubleView(books: topCards5)
            case 2:
                CardsDoubleView(books: topCards8)
            default:
                CardsDoubleView(books: topCards5)
            }
        }
    }
    
}

struct HomeTopScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeTopScreen()
    }
}
