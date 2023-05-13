using System;
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
    public class InfractionsController : ControllerBase
    {
        private readonly DMVContext _context;

        public InfractionsController(DMVContext context)
        {
            _context = context;
        }

        [Authorize]
        // GET: api/Infractions
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Infraction>>> GetInfractions()
        {
          if (_context.Infractions == null)
          {
              return NotFound();
          }
            return await _context.Infractions.ToListAsync();
        }

        [Authorize]
        // GET: api/Infractions/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Infraction>> GetInfraction(string id)
        {
          if (_context.Infractions == null)
          {
              return NotFound();
          }
            var infraction = await _context.Infractions.FindAsync(id);

            if (infraction == null)
            {
                return NotFound();
            }

            return infraction;
        }


        [Authorize]
        // PUT: api/Infractions/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutInfraction(string id, Infraction infraction)
        {
            if (id != infraction.InfractionId)
            {
                return BadRequest();
            }

            _context.Entry(infraction).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!InfractionExists(id))
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
        // POST: api/Infractions
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Infraction>> PostInfraction(Infraction infraction)
        {
          if (_context.Infractions == null)
          {
              return Problem("Entity set 'DMVContext.Infractions'  is null.");
          }
            _context.Infractions.Add(infraction);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (InfractionExists(infraction.InfractionId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetInfraction", new { id = infraction.InfractionId }, infraction);
        }

        [Authorize]
        // DELETE: api/Infractions/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteInfraction(string id)
        {
            if (_context.Infractions == null)
            {
                return NotFound();
            }
            var infraction = await _context.Infractions.FindAsync(id);
            if (infraction == null)
            {
                return NotFound();
            }

            _context.Infractions.Remove(infraction);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool InfractionExists(string id)
        {
            return (_context.Infractions?.Any(e => e.InfractionId == id)).GetValueOrDefault();
        }
    }
}
