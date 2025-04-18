 /*This Wont work untill you add the jar file 
 
 
 
 
 and compile with it */



 import java.awt.*;
import java.sql.*;
import javax.swing.*;

public class NovaPharmacyApp {
    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String USER = "";
    private static final String PASS = "";

    public static void main(String[] args) {
        // Main Menu Window
        JFrame mainFrame = new JFrame("NOVA Pharmacy System");
        mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        mainFrame.setSize(800, 500);

        JPanel panel = new JPanel(new GridLayout(3, 1));


        JButton btnAddPatient = new JButton("1. Add Patient");
        btnAddPatient.addActionListener(e -> openAddPatientForm());

        JButton btnAddDoctor = new JButton("2. Add Doctor");
        btnAddDoctor.addActionListener(e -> openAddPatientForm());

        JButton btnAddDrug = new JButton("1. Add Drug");
        btnAddDrug.addActionListener(e -> openAddPatientForm());

        
        panel.add(btnAddPatient);
        panel.add(btnAddDoctor);
        panel.add(btnAddDrug);
        mainFrame.add(panel);
        mainFrame.setVisible(true);
    }

    private static void openAddPatientForm() {
        JFrame patientFrame = new JFrame("Add New Patient");
        patientFrame.setSize(400, 300);

        JPanel formPanel = new JPanel(new GridLayout(6, 2));
        
        // Form Fields
        JTextField aadharField = new JTextField();
        JTextField nameField = new JTextField();
        JTextField addressField = new JTextField();
        JTextField ageField = new JTextField();
        JTextField doctorIdField = new JTextField();
        JButton submitBtn = new JButton("Submit");

        formPanel.add(new JLabel("Aadhar ID:"));
        formPanel.add(aadharField);
        formPanel.add(new JLabel("Name:"));
        formPanel.add(nameField);
        formPanel.add(new JLabel("Address:"));
        formPanel.add(addressField);
        formPanel.add(new JLabel("Age:"));
        formPanel.add(ageField);
        formPanel.add(new JLabel("Primary Doctor ID:"));
        formPanel.add(doctorIdField);
        formPanel.add(submitBtn);

        submitBtn.addActionListener(e -> {
            try {
                int aadhar = Integer.parseInt(aadharField.getText());
                String name = nameField.getText();
                String address = addressField.getText();
                int age = Integer.parseInt(ageField.getText());
                int doctorId = Integer.parseInt(doctorIdField.getText());

                addPatientToDatabase(aadhar, name, address, age, doctorId);
                JOptionPane.showMessageDialog(patientFrame, "Patient added successfully!");
                patientFrame.dispose();
            } catch (NumberFormatException ex) {
                JOptionPane.showMessageDialog(patientFrame, "Invalid input format!");
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(patientFrame, "Database Error: " + ex.getMessage());
            }
        });

        patientFrame.add(formPanel);
        patientFrame.setVisible(true);
    }

    private static void addPatientToDatabase(int aadhar, String name, String address, int age, int doctorId) 
        throws SQLException {
        String sql = "{call AddPatient(?, ?, ?, ?, ?)}";
        
        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
             CallableStatement stmt = conn.prepareCall(sql)) {
            
            stmt.setInt(1, aadhar);
            stmt.setString(2, name);
            stmt.setString(3, address);
            stmt.setInt(4, age);
            stmt.setInt(5, doctorId);
            
            stmt.executeUpdate();
            conn.commit();
        }
    }
}
