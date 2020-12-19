//
//  TimeWidget.swift
//  TimeWidget
//
//  Created by Mine on 7.12.2020.
//

import WidgetKit
import SwiftUI

struct DataProvider: TimelineProvider {
    typealias Entry = WidgetEntery
    let date = Date()
    
    func placeholder(in context: Context) -> WidgetEntery {
        WidgetEntery(date: date, text: date.widgetText)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (WidgetEntery) -> Void) {
        let entry =  WidgetEntery(date: date, text: date.widgetText)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<WidgetEntery>) -> Void) {
        var entries = [WidgetEntery]()
        let currentDate = Date()
        let midnight = Calendar.current.startOfDay(for: currentDate)
        let nextMidnight = Calendar.current.date(byAdding: .day, value: 1, to: midnight)!
        
        for offset in 0 ..< 60 * 24 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: offset, to: midnight)!
            entries.append(WidgetEntery(date: entryDate, text: entryDate.widgetText))
        }
        
        let timeline = Timeline(entries: entries, policy: .after(nextMidnight))
        completion(timeline)
    }
}


struct WidgetEntery: TimelineEntry {
   var date: Date
   var text: String
}

struct WidgetView: View {
   var entry: DataProvider.Entry
 
   var body: some View {
    VStack() {
        HStack {
            Spacer()
            Text("Time Widget")
                .fontWeight(.bold)
                .foregroundColor(.orange)
            Spacer()
        }
        .frame(height: 50.0)
        .background(Color.white)
        
        Spacer()
        
        HStack {
            Spacer()
            Text(entry.text)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .font(.system(size: 26)).foregroundColor(.white)
            Spacer()
        }
        
        Spacer()
    }.background(Color.orange)
   }
}

@main
struct TimeWidget: Widget {
    let kind: String = "TimeWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: DataProvider()) { entry in
            WidgetView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct TimeWidget_Previews: PreviewProvider {
    static var previews: some View {
        let date = Date()
        WidgetView(entry: WidgetEntery(date: date, text: date.widgetText))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
