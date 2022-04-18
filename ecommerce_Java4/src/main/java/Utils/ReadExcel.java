package Utils;

import entity.Products;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ReadExcel {
    public static final int COLUMN_INDEX_NAME = 0;
    public static final int COLUMN_INDEX_CATEGORY = 1;
    public static final int COLUMN_INDEX_SUPPLIER = 2;
    public static final int COLUMN_INDEX_PRICE = 3;
    public static final int COLUMN_INDEX_IMAGE = 4;
    public static final int COLUMN_INDEX_SIZE = 5;
    public static final int COLUMN_INDEX_COLOR = 6;
    public static final int COLUMN_INDEX_DES = 7;
    public static final int COLUMN_INDEX_QUANTITY = 8;

    public static void main(String[] args) throws IOException {
        final String excelFilePath = "D:/Book1.xlsx";
        final List<Products> books = readExcel(excelFilePath);
        for (Products book : books) {
            System.out.println(book.getNameProduct());
        }
    }

    public static List<Products> readExcel(String excelFilePath) throws IOException {
        List<Products> listBooks = new ArrayList<>();

        // Get file
        InputStream inputStream = new FileInputStream(new File(excelFilePath));

        // Get workbook
        Workbook workbook = getWorkbook(inputStream, excelFilePath);

        // Get sheet
        Sheet sheet = workbook.getSheetAt(0);

        // Get all rows
        Iterator<Row> iterator = sheet.iterator();
        while (iterator.hasNext()) {
            Row nextRow = iterator.next();
            //note
//            if (nextRow.getRowNum() == 0) {
//                // Ignore header
//                continue;
//            }

            // Get all cells
            Iterator<Cell> cellIterator = nextRow.cellIterator();

            // Read cells and set value for book object
            Products book = new Products();
            while (cellIterator.hasNext()) {
                //Read cell
                Cell cell = cellIterator.next();
                Object cellValue = getCellValue(cell);
                if (cellValue == null || cellValue.toString().isEmpty()) {
                    continue;
                }
                // Set value for book object
                int columnIndex = cell.getColumnIndex();
                switch (columnIndex) {
                    case COLUMN_INDEX_NAME:
                        book.setNameProduct((String) getCellValue(cell));
                        break;
                    case COLUMN_INDEX_CATEGORY:
                        book.setCategoryId(new BigDecimal((double) cellValue).intValue());
                        break;
                    case COLUMN_INDEX_SUPPLIER:
                        book.setSupplierId(new BigDecimal((double) cellValue).intValue());
                        break;
                    case COLUMN_INDEX_PRICE:
                        book.setPrice(new BigDecimal((double) cellValue).intValue());
                        break;

                    case COLUMN_INDEX_IMAGE:
                        book.setImageProduct((String) getCellValue(cell));
                        break;

                    case COLUMN_INDEX_SIZE:
                        book.setSize((String) getCellValue(cell));
                        break;

                    case COLUMN_INDEX_COLOR:
                        book.setColor((String) getCellValue(cell));
                        break;

                    case COLUMN_INDEX_DES:
                        book.setDescription((String) getCellValue(cell));
                        break;
                    case COLUMN_INDEX_QUANTITY:
                        book.setQuantity(new BigDecimal((double) cellValue).intValue());
                        break;

                    default:
                        break;
                }

            }
            listBooks.add(book);
        }

        workbook.close();
        inputStream.close();

        return listBooks;
    }

    // Get Workbook
    private static Workbook getWorkbook(InputStream inputStream, String excelFilePath) throws IOException {
        Workbook workbook = null;
        if (excelFilePath.endsWith("xlsx")) {
            workbook = new XSSFWorkbook(inputStream);
        } else if (excelFilePath.endsWith("xls")) {
            workbook = new HSSFWorkbook(inputStream);
        } else {
            throw new IllegalArgumentException("The specified file is not Excel file");
        }

        return workbook;
    }

    // Get cell value
    private static Object getCellValue(Cell cell) {
        CellType cellType = cell.getCellTypeEnum();
        Object cellValue = null;
        switch (cellType) {
            case BOOLEAN:
                cellValue = cell.getBooleanCellValue();
                break;
            case FORMULA:
                Workbook workbook = cell.getSheet().getWorkbook();
                FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
                cellValue = evaluator.evaluate(cell).getNumberValue();
                break;
            case NUMERIC:
                cellValue = cell.getNumericCellValue();
                break;
            case STRING:
                cellValue = cell.getStringCellValue();
                break;
            case _NONE:
            case BLANK:
            case ERROR:
                break;
            default:
                break;
        }

        return cellValue;
    }
}
