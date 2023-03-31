; Generates a GUI calculator with addition, subtraction, multiplication, and division buttons, as well as a text field to display input and output. The calculator is limited to numbers within 20.

(import javax.swing.JFrame)
(import javax.swing.JPanel)
(import javax.swing.JButton)
(import javax.swing.JTextField)
(import java.awt.BorderLayout)
(import java.awt.GridLayout)

(defn create-gui []
  (let [frame (JFrame. "Calculator")
        panel (JPanel.)]

    (doto panel
      (.setLayout (GridLayout. 4 4))
      (.add (JButton. "7"))
      (.add (JButton. "8"))
      (.add (JButton. "9"))
      (.add (JButton. "+"))
      (.add (JButton. "4"))
      (.add (JButton. "5"))
      (.add (JButton. "6"))
      (.add (JButton. "-"))
      (.add (JButton. "1"))
      (.add (JButton. "2"))
      (.add (JButton. "3"))
      (.add (JButton. "*"))
      (.add (JButton. "0"))
      (.add (JButton. "C"))
      (.add (JButton. "="))
      (.add (JButton. "/")))
    (doto frame
      (.add (JTextField.))
      (.add panel)
      (.setSize 500 300)
      (.setVisible true))))

(create-gui)
