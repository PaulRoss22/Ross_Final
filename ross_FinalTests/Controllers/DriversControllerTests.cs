using Microsoft.VisualStudio.TestTools.UnitTesting;
using ross_Final.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace ross_Final.Controllers.Tests
{
    [TestClass()]
    public class DriversControllerTests
    {
        public SqlCommand SqlCommand { get; private set; }

        [TestMethod]
        public void TestID()
        {
            // Create a connection to the database
            string connectionString = "Data Source=ROSS;Initial Catalog=DMV;User ID=sa;Password=ssms;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

            SqlConnection connection = new SqlConnection(connectionString);

            string query = "SELECT DriverId From Driver";

            SqlCommand command = new SqlCommand(query, connection);

            var expectedValue = "D01";

            connection.Open();
            string fieldValue = command.ExecuteScalar().ToString();
            connection.Close();

            Assert.AreEqual(expectedValue, fieldValue);
        }

        [TestMethod]
        public void TestFirstName()
        {
            // Create a connection to the database
            string connectionString = "Data Source=ROSS;Initial Catalog=DMV;User ID=sa;Password=ssms;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

            SqlConnection connection = new SqlConnection(connectionString);

            string query = "SELECT DriverFirstName From Driver";

            SqlCommand command = new SqlCommand(query, connection);

            var expectedValue = "Dorian";

            connection.Open();
            string fieldValue = command.ExecuteScalar().ToString();
            connection.Close();

            Assert.AreEqual(expectedValue, fieldValue);
        }

        [TestMethod]
        public void TestLastName()
        {
            // Create a connection to the database
            string connectionString = "Data Source=ROSS;Initial Catalog=DMV;User ID=sa;Password=ssms;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

            SqlConnection connection = new SqlConnection(connectionString);

            string query = "SELECT DriverLastName From Driver";

            SqlCommand command = new SqlCommand(query, connection);

            var expectedValue = "Guzman";

            connection.Open();
            string fieldValue = command.ExecuteScalar().ToString();
            connection.Close();

            Assert.AreEqual(expectedValue, fieldValue);
        }

        [TestMethod]
        public void TestSSN()
        {
            // Create a connection to the database
            string connectionString = "Data Source=ROSS;Initial Catalog=DMV;User ID=sa;Password=ssms;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

            SqlConnection connection = new SqlConnection(connectionString);

            string query = "SELECT DriverSSN From Driver";

            SqlCommand command = new SqlCommand(query, connection);

            var expectedValue = "011-42-1171";

            connection.Open();
            string fieldValue = command.ExecuteScalar().ToString();
            connection.Close();

            Assert.AreEqual(expectedValue, fieldValue);
        }

        [TestMethod]
        public void TestGender()
        {
            // Create a connection to the database
            string connectionString = "Data Source=ROSS;Initial Catalog=DMV;User ID=sa;Password=ssms;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

            SqlConnection connection = new SqlConnection(connectionString);

            string query = "SELECT DriverGender From Driver";

            SqlCommand command = new SqlCommand(query, connection);

            var expectedValue = "F";

            connection.Open();
            string fieldValue = command.ExecuteScalar().ToString();
            connection.Close();

            Assert.AreEqual(expectedValue, fieldValue);
        }
    }
}