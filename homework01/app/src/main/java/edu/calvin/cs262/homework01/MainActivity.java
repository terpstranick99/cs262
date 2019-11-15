package edu.calvin.cs262.homework01;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity implements AdapterView.OnItemSelectedListener {
    private int operand1 = 0;
    private int operand2 = 0;
    private String my_operator;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        // This code creates the spinner.
        Spinner spinn er = findViewById(R.id.operator_spinner);
        if (spinner != null) {
            spinner.setOnItemSelectedListener(this);
        }
        // This code creates the ArrayAdapter using a string array.
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this,
                R.array.operators_array, android.R.layout.simple_spinner_item);
        // This code sets up the layout
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        // this applies the adapter to the array
        if (spinner != null) {
            spinner.setAdapter(adapter);
        }
    }

    // This code creates the logic of the calculator
    public void calculateResult(View view) {
        EditText value1 = findViewById(R.id.value_1_entry);
        operand1 = Integer.parseInt(value1.getText().toString());
        EditText value2 = findViewById(R.id.value_2_entry);
        operand2 = Integer.parseInt(value2.getText().toString());
        int result;
        switch (my_operator) {
            // If plus, add the two operands together
            case "+":
                result = operand1 + operand2;
                break;
            // If minus, subtract the second operand from the first
            case "-":
                result = operand1 - operand2;
                break;
            // If multiply, multiply the two operands
            case "*":
                result = operand1 * operand2;
                break;
            // If divide, divide the operands
            case "/":
                result = operand1 / operand2;
                break;
            case "%":
                result = operand1 % operand2;
                break;
            default:
                // If you click the calculate button but do not enter an operand, a toast will appear
                Toast.makeText(getApplicationContext(), "Must select an operand!", Toast.LENGTH_SHORT).show();
                return;
        }
        TextView result_view = findViewById(R.id.result_view);
        result_view.setText(String.format("%d", result));
    }

    @Override
    public void onItemSelected(AdapterView<?> adapterView, View view, int i, long l) {
        my_operator = adapterView.getItemAtPosition(i).toString();
    }

    @Override
    public void onNothingSelected(AdapterView<?> adapterView) {

    }

    @Override
    protected void onPause() {
        super.onPause();

        // save values
        EditText value1 = findViewById(R.id.value_1_entry);
        operand1 = Integer.parseInt(value1.getText().toString());
        EditText value2 = findViewById(R.id.value_2_entry);
        operand2 = Integer.parseInt(value2.getText().toString());
        Log.d("MainActivity", String.format("onPause. value1: %d, value2: %d, operator: %s", operand1, operand2, my_operator));
    }

    @SuppressLint("DefaultLocale")
    @Override
    protected void onResume() {
        super.onResume();

        Log.d("MainActivity", String.format("onResume. value1: %d, value2: %d, operator: %s", operand1, operand2, my_operator));
        EditText value1 = findViewById(R.id.value_1_entry);
        value1.setText(String.format("%d", operand1));
        EditText value2 = findViewById(R.id.value_2_entry);
        value2.setText(String.format("%d", operand2));
    }
}
