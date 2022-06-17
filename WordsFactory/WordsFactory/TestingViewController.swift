//
//  TestingViewController.swift
//  WordsFactory
//
//  Created by Максим Неверовский on 16.06.2022.
//

import UIKit

class TestingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    import XCTest
    @testable import CodeWarsTesting

    class CodeWarsUnitTests: XCTestCase {
        var foldArray = CodeWarsTask()
        
        func testWhenInputIsEmptyArray() {
            let array = [] as [Int]
            let result = foldArray.foldArray(arr: array)
            XCTAssertEqual(result, [])
        }
        
        func testWhenInputIsNegativeAndPositiveNumbers() {
            let array = [-9, 10, -100, -234, 34, 5] as [Int]
            let result = foldArray.foldArray(arr: array)
            XCTAssertEqual( result, [-4, 44, -334])
        }
        
        func testWhenInputIsTimesMoreLengthArray() {
            let array = [1, 2, 3, 4, 5] as [Int]
            let result = foldArray.foldArray(arr: array, times: 10)
            XCTAssertEqual( result, [15])
        }
        
        AF.request(apiMethod, method: .post, parameters: ["email":EmailTextField.text!,"password": PasswordTextField.text!], encoding: JSONEncoding.default).responseData{ [self] response in
            switch response.result{
            case .success (let data):
                print("Регистрация:", response.response!.statusCode)
                result = try? JSONDecoder().decode(test.self, from: data)
                
                if response.response!.statusCode == 200{
                    let vc = InterestsViewController()
                    vc.accessToken = result!.accessToken
                    vc.refreshToken = result!.refreshToken
                    navigationController?.pushViewController(vc, animated: true)
                }
                else if response.response!.statusCode == 400{
                    
                    let alert = UIAlertController(title: "Внимание", message: "Введите корректные данные", preferredStyle: .alert)
                    let okeyButton = UIAlertAction(title: "Ok", style: .cancel )
                    alert.addAction(okeyButton)
                    
                    self.present(alert, animated: true, completion: nil)
                    
                }
                else if response.response!.statusCode == 409{
                    let alert = UIAlertController(title: "Внимание", message: "Такой пользователь уже существует", preferredStyle: .alert)
                    let okeyButton = UIAlertAction(title: "Ok", style: .cancel )
                    alert.addAction(okeyButton)
                    
                    self.present(alert, animated: true, completion: nil)
                }
                else if response.response!.statusCode == 500{
                    let alert = UIAlertController(title: "Упс...", message: "Что-то пошло не так", preferredStyle: .alert)
                    let okeyButton = UIAlertAction(title: "Ok", style: .cancel )
                    alert.addAction(okeyButton)
                    
                    self.present(alert, animated: true, completion: nil)
                }
        func testWhenInputIsTimesEqualZero() {
            let array = [1, 2, 3, 4, 5] as [Int]
            let result = foldArray.foldArray(arr: array, times: 0)
            XCTAssertEqual( result, [1, 2, 3, 4, 5])
        }
        
        func testWhenInputArrayModified() {
            let array = [1, 2, 3, 4, 5] as [Int]
            _ = foldArray.foldArray(arr: array, times: 10)
            XCTAssertEqual( array, [1, 2, 3, 4, 5])
        }
        
    }

}
