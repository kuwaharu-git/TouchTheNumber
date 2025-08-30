//
//  ContentView.swift
//  TouchTheNumber
//
//  Created by 桑島陽斗 on 2025/08/30.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var nextNumber: Int = 1
    @State var randm_num_list = Array(1...9).shuffled()
    @State var is_game = false
    @State var timerHandler: Timer?
    @State var count = 0
    
    // データベース系
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Record.record_time, order: .forward)
    private var records: [Record]
    var body: some View {
        if !is_game {
            Text("TouchTheNumber")
            Button {
                is_game.toggle()
                startTimer()
            } label: {
                Text("start!")
            }
            ForEach(records) { record in
                Text("\(record.record_time)秒")
            }

        } else if nextNumber > 9 {
            Text("Finish")
                .font(.title)
            Text("結果\(count)秒")
            Button {
                nextNumber = 1
                count = 0
                startTimer()
            } label: {
                Text("one more")
            }
            ForEach(records) { record in
                    Text("\(record.record_time)秒")
            }

            
        } else {
            VStack {
                Text("\(nextNumber)")
                    .font(.title)
                HStack {
                    Button {
                        if nextNumber == (randm_num_list[0]) {
                            nextNumber += 1
                        }
                    } label: {
                        Text("\(randm_num_list[0])")
                            .font(.title)
                            .padding()
                            .frame(width: 80, height: 80)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(.circle)
                    }
                    Button {
                        if nextNumber == (randm_num_list[1]) {
                            nextNumber += 1
                        }
                    } label: {
                        Text("\(randm_num_list[1])")
                            .font(.title)
                            .padding()
                            .frame(width: 80, height: 80)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(.circle)
                    }
                    Button {
                        if nextNumber == (randm_num_list[2]) {
                            nextNumber += 1
                        }
                    } label: {
                        Text("\(randm_num_list[2])")
                            .font(.title)
                            .padding()
                            .frame(width: 80, height: 80)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(.circle)
                    }
                }
                HStack {
                    Button {
                        if nextNumber == (randm_num_list[3]) {
                            nextNumber += 1
                        }
                    } label: {
                        Text("\(randm_num_list[3])")
                            .font(.title)
                            .padding()
                            .frame(width: 80, height: 80)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(.circle)
                    }
                    Button {
                        if nextNumber == (randm_num_list[4]) {
                            nextNumber += 1
                        }
                    } label: {
                        Text("\(randm_num_list[4])")
                            .font(.title)
                            .padding()
                            .frame(width: 80, height: 80)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(.circle)
                    }
                    Button {
                        if nextNumber == (randm_num_list[5]) {
                            nextNumber += 1
                        }
                    } label: {
                        Text("\(randm_num_list[5])")
                            .font(.title)
                            .padding()
                            .frame(width: 80, height: 80)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(.circle)
                    }
                }
                HStack {
                    Button {
                        if nextNumber == (randm_num_list[6]) {
                            nextNumber += 1
                        }
                    } label: {
                        Text("\(randm_num_list[6])")
                            .font(.title)
                            .padding()
                            .frame(width: 80, height: 80)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(.circle)
                    }
                    Button {
                        if nextNumber == (randm_num_list[7]) {
                            nextNumber += 1
                        }
                    } label: {
                        Text("\(randm_num_list[7])")
                            .font(.title)
                            .padding()
                            .frame(width: 80, height: 80)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(.circle)
                    }
                    Button {
                        if nextNumber == (randm_num_list[8]) {
                            nextNumber += 1
                        }
                    } label: {
                        Text("\(randm_num_list[8])")
                            .font(.title)
                            .padding()
                            .frame(width: 80, height: 80)
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(.circle)
                    }
                }

            }
        }

    }
    func countsecond() {
        if nextNumber == 10 {
            do{
                let newRecord = Record(datetime: Date(), record_time: count)
                modelContext.insert(newRecord)
                try modelContext.save()
            } catch {
                print("データベース保存エラー")
            }
            timerHandler?.invalidate()
        } else {
            count += 1
        }

    }
    
    func startTimer() {
        timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            Task {
                @MainActor in
                countsecond()
            }
        }
    }
}



#Preview {
    ContentView()
}
