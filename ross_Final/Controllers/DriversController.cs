﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ross_Final.Data;
using ross_Final.Models;

namespace ross_Final.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DriversController : ControllerBase
    {
        private readonly DMVContext _context;

        public DriversController(DMVContext context)
        {
            _context = context;
        }

        [Authorize]
        // GET: api/Drivers
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Driver>>> GetDrivers()
        {
          if (_context.Drivers == null)
          {
              return NotFound();
          }
            return await _context.Drivers.ToListAsync();
        }

        [Authorize]
        // GET: api/Drivers/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Driver>> GetDriver(string id)
        {
          if (_context.Drivers == null)
          {
              return NotFound();
          }
            var driver = await _context.Drivers.FindAsync(id);

            if (driver == null)
            {
                return NotFound();
            }

            return driver;
        }

        [Authorize]
        // GET: api/Drivers/5
        [HttpGet("{ssn}")]
        public async Task<ActionResult<Driver>> GetDriverSSN(string ssn)
        {
            if (_context.Drivers == null)
            {
                return NotFound();
            }
            var driver = await _context.Drivers.FindAsync(ssn);

            if (driver == null)
            {
                return NotFound();
            }

            return driver;
        }


        [Authorize]
        // PUT: api/Drivers/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutDriver(string id, Driver driver)
        {
            if (id != driver.DriverId)
            {
                return BadRequest();
            }

            _context.Entry(driver).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DriverExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        [Authorize]
        // POST: api/Drivers
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Driver>> PostDriver(Driver driver)
        {
          if (_context.Drivers == null)
          {
              return Problem("Entity set 'DMVContext.Drivers'  is null.");
          }
            _context.Drivers.Add(driver);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (DriverExists(driver.DriverId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetDriver", new { id = driver.DriverId }, driver);
        }

        [Authorize]
        // DELETE: api/Drivers/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteDriver(string id)
        {
            if (_context.Drivers == null)
            {
                return NotFound();
            }
            var driver = await _context.Drivers.FindAsync(id);
            if (driver == null)
            {
                return NotFound();
            }

            _context.Drivers.Remove(driver);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool DriverExists(string id)
        {
            return (_context.Drivers?.Any(e => e.DriverId == id)).GetValueOrDefault();
        }
    }
}
