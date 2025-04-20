//
//  ViewController.swift
//  ioscalculadora
//
//  Created by user276506 on 4/19/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numero1TextField: UITextField!
    @IBOutlet weak var numero2TextField: UITextField!
    @IBOutlet weak var somarButton: UIButton!
    @IBOutlet weak var resultadoLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        dynamicType()
        acessibilidade()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mudarCores()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Ordem do VoiceOver
        self.view.accessibilityElements = [
            numero1TextField!,
            numero2TextField!,
            somarButton!,
            resultadoLabel!
        ]
    }

    @IBAction func somarNumeros(_ sender: UIButton) {
        let num1 = Double(numero1TextField.text ?? "") ?? 0
        let num2 = Double(numero2TextField.text ?? "") ?? 0
        let resultado = num1 + num2

        resultadoLabel.text = "Resultado: \(resultado)"
        resultadoLabel.accessibilityValue = "\(resultado)"
        UIAccessibility.post(notification: .announcement, argument: "Resultado da soma é \(resultado)")
    }

    func dynamicType() {
        numero1TextField.adjustsFontForContentSizeCategory = true
        numero2TextField.adjustsFontForContentSizeCategory = true
        resultadoLabel.adjustsFontForContentSizeCategory = true
        somarButton.titleLabel?.adjustsFontForContentSizeCategory = true
    }

    func mudarCores() {
        if UIAccessibility.isDarkerSystemColorsEnabled {
            view.backgroundColor = .black
            resultadoLabel.textColor = .yellow

            numero1TextField.backgroundColor = .white
            numero1TextField.textColor = .black

            numero2TextField.backgroundColor = .white
            numero2TextField.textColor = .black

            somarButton.setTitleColor(.black, for: .normal)
            somarButton.backgroundColor = .yellow
            somarButton.layer.cornerRadius = 10
            somarButton.layer.masksToBounds = true
        } else {
            view.backgroundColor = UIColor(named: "BackgroundColor") ?? UIColor.systemBackground
            resultadoLabel.textColor = .label

            numero1TextField.backgroundColor = .secondarySystemBackground
            numero1TextField.textColor = .label

            numero2TextField.backgroundColor = .secondarySystemBackground
            numero2TextField.textColor = .label

            somarButton.setTitleColor(.white, for: .normal)
            somarButton.backgroundColor = .systemBlue
            somarButton.layer.cornerRadius = 10
            somarButton.layer.masksToBounds = true
        }
    }

    func acessibilidade() {
        numero1TextField.accessibilityLabel = "Campo primeiro número"
        numero1TextField.accessibilityHint = "Digite o primeiro número"
        numero1TextField.accessibilityTraits = .none

        numero2TextField.accessibilityLabel = "Campo segundo número"
        numero2TextField.accessibilityHint = "Digite o segundo número"
        numero2TextField.accessibilityTraits = .none

        somarButton.accessibilityLabel = "Botão de somar"
        somarButton.accessibilityHint = "Toque para calcular a soma"
        somarButton.accessibilityTraits = .button

        resultadoLabel.accessibilityLabel = "Resultado da soma"
        resultadoLabel.accessibilityTraits = .staticText
    }
}

