import UIKit

//Presentation
//UI - ViewController

//VM

protocol SomeViewModelProtocol {
    var someText: String { get }
    
}

class SomeViewModel: SomeViewModelProtocol {
    var useCase: SomeUseCaseProtocol!
    
    var someText: String {
        return "Hello, World!"
    }
    
    init(useCase: SomeUseCaseProtocol!) {
        self.useCase = useCase
    }
    
    func someMethod() {
        useCase.executeSomeMethod()
    }
}

//Domain - business logic
//UseCases
//
protocol SomeUseCaseProtocol {
    func executeSomeMethod()
}


class SomeUseCase: SomeUseCaseProtocol {
    var repository: SomeRepositoryProtocol!
    
    init(repository: SomeRepositoryProtocol!) {
        self.repository = repository
    }
    
    func executeSomeMethod() {
        repository.getUserName()
    }
}

//Data - Repository and DataSource - Network/API calls

protocol SomeRepositoryProtocol {
    func getUserName() -> String
}

class Repository: SomeRepositoryProtocol {
    func getUserName() -> String {
        return "John"
    }
}


//DataSource - coredata, system data

protocol SomeDataSourceProtocol {
    
}

class DataSource: SomeDataSourceProtocol {
    
}

* unit
snapshot test
Swift Ui
accesibity test
