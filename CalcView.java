package database;
import java.awt.*;
import javax.swing.*;
import java.awt.event.*;

class CalcView extends JFrame {

	public JLabel label1;
	
    public JTextField userInput = new JTextField(5);
    public JTextField input = new JTextField(5);
    private JTextField m_totalTf     = new JTextField(20);
    
    public JButton runButton = new JButton("Run");
    public JButton runButton2 = new JButton("Run");
    
    private JButton m_clearBtn = new JButton("Clear");
    
    private JButton button3a =new JButton("3a");
    private JButton button3b =new JButton("3b");
    private JButton button4a =new JButton("4a");
    private JButton button4b =new JButton("4b");
    private JButton button5a =new JButton("5a");
    private JButton button5b =new JButton("5b");
    private JButton button6a =new JButton("6a");
    private JButton button6b =new JButton("6b");
    
    public JButton backButton=new JButton("Back");
    public JButton backButton2=new JButton("Back");
    
    private CalcModel m_model;
    
    public CalcView(CalcModel model) {
     
   
        m_model = model;
        m_model.setValue(CalcModel.INITIAL_VALUE);
        
   
        m_totalTf.setText(m_model.getValue());
        m_totalTf.setEditable(false);
      
        JPanel content = new JPanel();
        content.setBorder(BorderFactory.createEmptyBorder(70,70,70,70));
        content.setLayout(new GridLayout(0, 4));
        content.add(new JLabel("Insert a SELECT statement:"));
        content.add(userInput);
        content.add(runButton);
        content.add(m_clearBtn);
        content.add(button3a);
        content.add(button3b);
        content.add(button4a);
        content.add(button4b);
        content.add(button5a);
        content.add(button5b);
        content.add(button6a);
        content.add(button6b);
      
        this.setContentPane(content);
        this.pack();
        content.setBackground(Color.PINK);
        this.setTitle("Driving School Database");
       
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }
    
    void reset() {
       userInput.setText("");
    }
    
    String getUserInput() {
        return userInput.getText();
    }
    
    void setTotal(String newTotal) {
        m_totalTf.setText(newTotal);
    }
    
    void showError(String errMessage) {
        JOptionPane.showMessageDialog(this, errMessage);
    }
    
    void addRunListener(ActionListener action) {
        runButton.addActionListener(action);
    }
    
    void addRunListener2(ActionListener action) {
        runButton2.addActionListener(action);
    }
    
    void addClearListener(ActionListener action) {
        m_clearBtn.addActionListener(action);
    }
    void addBackListener(ActionListener action) {
        backButton.addActionListener(action);}
      
    void addBackListener2(ActionListener action) {
        backButton2.addActionListener(action);}
    
    void addButton3aListener(ActionListener action) {
    	button3a.addActionListener(action);
    }
    
    void addButton3bListener(ActionListener action) {
    	button3b.addActionListener(action);}
    
   void addButton4aListener(ActionListener action) {
        button4a.addActionListener(action);}
   
   void addButton4bListener(ActionListener action) {
   	button4b.addActionListener(action);}
    
   void addButton5aListener(ActionListener action) {
   	button5a.addActionListener(action);}
   
   void addButton5bListener(ActionListener action) {
   	button5b.addActionListener(action);}
   
   void addButton6aListener(ActionListener action) {
   	button6a.addActionListener(action);}
   
   void addButton6bListener(ActionListener action) {
    button6b.addActionListener(action);}
}
