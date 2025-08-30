import SwiftUI

struct ContentView: View {
    @State var is_game_start = false
    @State var next_number = 1
    @State var random_number_list: [Int] = []   // ← 状態で保持する

    var body: some View {
        if !is_game_start {
            Text("TouchTheNumber")
                .font(.largeTitle)
                .padding()
            Button {
                // ゲーム開始時にシャッフルして1回だけ決定
                random_number_list = Array(1...9).shuffled()
                next_number = 1
                is_game_start = true
            } label: {
                Text("Game Start!")
                    .font(.title)
                    .foregroundStyle(.white)
                    .frame(width: 150, height: 150)
                    .background(Color.blue)
                    .clipShape(.circle)
            }
        } else if next_number == 10 {

            Text("Complete!")
                .font(.largeTitle)
            Button {
                random_number_list = Array(1...9).shuffled()
                next_number = 1
            } label: {
                Text("Game Start")
            }

        }else {
            VStack {
                ForEach(0..<3, id: \.self) { i in
                    HStack {
                        ForEach(0..<3, id: \.self) { j in
                            let number = random_number_list[i * 3 + j]
                            Button {
                                if next_number == number {
                                    next_number += 1
                                }
                            } label: {
                                Text("\(number)")
                                    .font(.title)
                                    .frame(width: 60, height: 60)
                                    .background(next_number <= number ? Color.gray.opacity(0.2) : Color.red.opacity(0.2))
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
