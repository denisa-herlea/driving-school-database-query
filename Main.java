package database;

import javax.swing.*;
import java.awt.*;

import javax.swing.table.DefaultTableModel;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

import java.sql.*;
import java.util.Vector;

public class Main {

    public static void main(String[] args) throws Exception {
       
       
       CalcModel calcModel = new CalcModel();
       CalcView calcView=new CalcView(calcModel);
       CalcController calcController= new CalcController(calcModel, calcView);
       calcView.setVisible(true);
    }}