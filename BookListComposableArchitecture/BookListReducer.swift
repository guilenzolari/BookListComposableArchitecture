import ComposableArchitecture
import Foundation

class BookListReducer: Reducer {
    //We will keep our book list here
    struct State: Equatable {
        var books: [Book]?
    }
    
    //We will keep actions like fetchBooks and booksFetched here
    enum Action {
        case fetchBooks
        case booksFetched([Book]?)
    }
    
    //Function to perform actions and update state
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action{
        case .fetchBooks:
            return .run{ send in
                let bookListUrl = "https://anapioficeandfire.com/api/books"
                let (data, _) = try await URLSession.shared.data(from: URL(string: bookListUrl)!)
                let books = try? JSONDecoder().decode([Book].self, from: data)
                await send(.booksFetched(books))
            }
            
        case let .booksFetched(books):
            state.books = books
            return .none
            
        }
    }
    
}
