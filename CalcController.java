package database;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

public class CalcController {
    
    private CalcModel m_model;
    public CalcView  m_view;
    public JFrame myFrame = new JFrame();
    public JFrame myFrame2 = new JFrame();
   
   public CalcController(CalcModel model, CalcView view) {
        m_model = model;
        m_view  = view;
        
      
        view.addRunListener(new RunListener());
        view.addRunListener2(new RunListener2());
        view.addClearListener(new ClearListener());
        view.addBackListener(new BackListener());
        view.addButton3aListener(new Button3aListener());
        view.addButton3bListener(new Button3bListener());
        view.addButton4aListener(new Button4aListener());
        view.addButton4bListener(new Button4bListener());
        view.addButton5aListener(new Button5aListener());
        view.addButton5bListener(new Button5bListener());
        view.addButton6aListener(new Button6aListener());
        view.addButton6bListener(new Button6bListener());
        view.addBackListener2(new BackListener2());
    }
    
    
    public static DefaultTableModel buildTableModel(ResultSet rs)
            throws SQLException {

        ResultSetMetaData metaData = (ResultSetMetaData) rs.getMetaData();

       
        Vector<String> columnNames = new Vector<String>();
        int columnCount = metaData.getColumnCount();
        for (int column = 1; column <= columnCount; column++) {
            columnNames.add(metaData.getColumnName(column));
        }


     
        Vector<Vector<Object>> data = new Vector<Vector<Object>>();
        while (rs.next()) {
            Vector<Object> vector = new Vector<Object>();
            for (int columnIndex = 1; columnIndex <= columnCount; columnIndex++) {
                vector.add(rs.getObject(columnIndex));
            }
            data.add(vector);
        }

        return new DefaultTableModel(data, columnNames);

    }
    
    public void StatementExec (String statement,String name) throws Exception {
    	
    	 String q = statement;
    	 
         Connection conn = null;
         PreparedStatement prepStmt = null;
         ResultSet rs = null;
         ConnectionDatabase con=new ConnectionDatabase();
         conn = con.getConn();
         prepStmt = conn.prepareStatement(q);
         rs = prepStmt.executeQuery();
         java.sql.ResultSetMetaData metaData = rs.getMetaData();
 
         JTable table = new JTable(buildTableModel(rs));
      
         JPanel fereastra = new JPanel();

         JScrollPane jsp = new JScrollPane(table);
         myFrame.getContentPane().add(jsp);
         
         fereastra.setLayout(new BorderLayout());
         fereastra.add(jsp);
         fereastra.add(m_view.backButton, BorderLayout.PAGE_END);
         
   
        myFrame.setContentPane(fereastra);
        myFrame.setTitle(name);
  
        myFrame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        myFrame.setSize(600, 400);
        myFrame.setVisible(true);
    }
    
    
    public void StatementExec2 (String statement,String name,String label) throws Exception {
    	
   	    String q = statement;
   	    m_view.input=new JTextField(5);
    	final JLabel label1=new JLabel(label);
    	

        Connection conn = null;
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
        ConnectionDatabase con=new ConnectionDatabase();
        conn = con.getConn();
        prepStmt = conn.prepareStatement(q);
        rs = prepStmt.executeQuery();
        java.sql.ResultSetMetaData metaData = rs.getMetaData();


        JTable table = new JTable(buildTableModel(rs));
        
        JPanel window1 = new JPanel();
        JPanel fereastra2=new JPanel();

        JScrollPane jsp = new JScrollPane(table);
        myFrame.getContentPane().add(jsp);
        
        window1.setLayout(new FlowLayout());
        window1.setBorder(BorderFactory.createEmptyBorder(90,90,90,90));
      
        window1.add(label1);
        window1.add(m_view.input);
        window1.add(m_view.runButton2);
        window1.add(m_view.backButton, BorderLayout.PAGE_END);
        
  
       myFrame.setContentPane(window1);
       myFrame.setTitle(name);
 
       myFrame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
       myFrame.setSize(600, 400);
       myFrame.setVisible(true);
   }
    
    public void StatementExec3 (String statement1, String statement2 ,String name) throws Exception {
    
   	   
        String q; 
        q=statement1+m_view.input.getText()+statement2;
       
        Connection conn = null;
        PreparedStatement prepStmt = null;
        ResultSet rs = null;
        ConnectionDatabase con=new ConnectionDatabase();
        conn = con.getConn();
        prepStmt = conn.prepareStatement(q);
        rs = prepStmt.executeQuery();
        java.sql.ResultSetMetaData metaData = rs.getMetaData();

        

        
        JTable table = new JTable(buildTableModel(rs));
       
        JPanel fereastra = new JPanel();

        JScrollPane jsp = new JScrollPane(table);
        myFrame.getContentPane().add(jsp);
        
        fereastra.setLayout(new BorderLayout());
        fereastra.add(jsp);
        fereastra.add(m_view.backButton, BorderLayout.PAGE_END);
        
  
       myFrame.setContentPane(fereastra);
       myFrame.setTitle(name);
 
       myFrame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
       myFrame.setSize(600, 400);
       myFrame.setVisible(true);
   }
    
   
    class RunListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            String userInput = "";
                userInput = m_view.getUserInput();
               try {
				StatementExec(userInput,userInput);
			} catch (Exception e1) {
				System.out.println("Bad input!");
			}
                
                
        }
    }
    class RunListener2 implements ActionListener {
        public void actionPerformed(ActionEvent e) {
        	String statement1 = "";
        	String statement2="";
        	String name="";
        	if(myFrame.getTitle().equals("Sa se gaseasca raspunsurile pentru intrebarea cu id_i =? ordonat crescator dupa corect."))
        	{
        		statement1="SELECT * FROM Answer where id_i=";
        		statement2=" ORDER BY corect";
        		
        	}
        	
        	if(myFrame.getTitle().equals("Sa se gaseasca raspunsurile la testul cu id_t = ? ordonat crescator dupa id_i si descrescator dupa id_r."))
        	{
        		statement1="SELECT * from TestAnswer where id_t=";
        		statement2=" ORDER BY id_i ASC, id_r DESC";
        		
        	}
        	
        	if(myFrame.getTitle().equals("Sa se gaseasca raspunsurile date si raspunsurile model la testele pentru care s-a obtinut punctaj sub ?."))
        	{
        		statement1="SELECT Test.id_t,r1.id_i, r1.id_r, r1.corect, r2.id_i, r2.id_r, r2.Answer, r2.corect\r\n"
        				+ "FROM TestAnswer r1 JOIN Answer r2 ON( r1.id_i=r2.id_i AND r1.id_r=r2.id_r) JOIN Test ON (Test.punctaj<=";
        		statement2=" ) ORDER BY Test.id_t,r1.id_i,r1.id_r";
        		
        	}
        	
        	if(myFrame.getTitle().equals("Sa se gaseasca raspunsurile valide la testul cu identificatorul ? (id_i, id_r)."))
        	{
        		statement1="SELECT id_i,id_r, Answer, corect from Answer WHERE id_i \r\n"
        				+ "IN (select id_i from QuestionnaireQuestions WHERE id_c=(select id_c from Test WHERE id_t=";
        		statement2="))";
        		
        	}
              try {
				StatementExec3(statement1,statement2,name);
			} catch (Exception e1) {
				System.out.println("Bad input!");
			}     
        }
    }
 
    class ClearListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
            m_model.reset();
            m_view.reset();
        }
    }
    
    class BackListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
        	myFrame.setVisible(false);
        }
    }
    
    class BackListener2 implements ActionListener {
        public void actionPerformed(ActionEvent e) {
        	myFrame2.setVisible(false);
        }
    }
    
    class Button3aListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
        	String userInput = "SELECT * FROM Answer where id_i=3 ORDER BY corect";
           try {
        	 
			StatementExec2(userInput,"Sa se gaseasca raspunsurile pentru intrebarea cu id_i =? ordonat crescator dupa corect.","Insert id:");
			
		} catch (Exception e1) {
			System.out.println("Eroare 3a!");
		}
            
       } 	
        }
    
    class Button3bListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
        	String userInput = "SELECT * from TestAnswer where id_t=1 ORDER BY id_i ASC, id_r DESC";
           try {
        	 
			StatementExec2(userInput,"Sa se gaseasca raspunsurile la testul cu id_t = ? ordonat crescator dupa id_i si descrescator dupa id_r.","Insert id_t:");
			
		} catch (Exception e1) {
			System.out.println("Eroare 3b!");
		}
            
       } 	
        }
    class Button4aListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
        	String userInput = "SELECT Test.id_t,r1.id_i, r1.id_r, r1.corect, r2.id_i, r2.id_r, r2.Answer, r2.corect\r\n"
        			+ "FROM TestAnswer r1 JOIN Answer r2 ON( r1.id_i=r2.id_i AND r1.id_r=r2.id_r) JOIN Test ON (Test.punctaj<=22) ORDER BY Test.id_t,r1.id_i,r1.id_r";
           try {
			StatementExec2(userInput,"Sa se gaseasca raspunsurile date si raspunsurile model la testele pentru care s-a obtinut punctaj sub ?.","Insert punctaj:");
		} catch (Exception e1) {
			System.out.println("Eroare 4a!");
		}
        }
    }
    
    class Button4bListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
        	String userInput = "call sys.procedure";
           try {
			StatementExec(userInput,"Sa se gaseasca perechi de chestionare (id_c1, id_c2) pentru chestionare diferite care contin cel putin o intrebare comuna. O pereche este unica in rezultat.");
		} catch (Exception e1) {
			System.out.println("Eroare 4b!");
		}
        }
    }
    class Button5aListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
        	String userInput = "SELECT id_i,id_r, Answer, corect from Answer WHERE id_i \r\n"
        			+ "IN (select id_i from QuestionnaireQuestions WHERE id_c=(select id_c from Test WHERE id_t=1))";
           try {
			StatementExec2(userInput,"Sa se gaseasca raspunsurile valide la testul cu identificatorul ? (id_i, id_r).","Insert id_t:");
		} catch (Exception e1) {
			System.out.println("Eroare 5a!");
		}
        }
    }
    class Button5bListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
        	String userInput = "SELECT id_t FROM Test WHERE punctaj<=ALL(select punctaj from Test)";
           try {
			StatementExec(userInput,"Sa se gaseasca identificatorul testului cu punctajul cel mai mic.");
		} catch (Exception e1) {
			System.out.println("Eroare 5b!");
		}
        }
    }
    class Button6aListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
        	String userInput = "SELECT id_c, denumire FROM Questionnaire WHERE punctaj_max=(SELECT max(punctaj_max) FROM Questionnaire)";
           try {
			StatementExec(userInput, "Sa se gaseasca chestionarele care au punctajul maxim cel mai mare.");
		} catch (Exception e1) {
			System.out.println("Eroare 6a!");
		}
        }
    }
    
    class Button6bListener implements ActionListener {
        public void actionPerformed(ActionEvent e) {
        	String userInput = "SELECT id_i, count(corect) FROM Answer WHERE corect='D' GROUP BY id_i HAVING count(corect)>=2";
           try {
			StatementExec(userInput,"Sa se gaseasca intrebarile care au doua sau mai multe raspunsuri cu corect ='D'");
		} catch (Exception e1) {
			System.out.println("Eroare 6b!");
		}
        }
    }
}
