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
    public class InfractionInfosController : ControllerBase
    {
        private readonly DMVContext _context;

        public InfractionInfosController(DMVContext context)
        {
            _context = context;
        }

        [Authorize]
        // GET: api/InfractionInfos
        [HttpGet]
        public async Task<ActionResult<IEnumerable<InfractionInfo>>> GetInfractionInfos()
        {
          if (_context.InfractionInfos == null)
          {
              return NotFound();
          }
            return await _context.InfractionInfos.ToListAsync();
        }

        [Authorize]
        // GET: api/InfractionInfos/5
        [HttpGet("{id}")]
        public async Task<ActionResult<InfractionInfo>> GetInfractionInfo(string id)
        {
          if (_context.InfractionInfos == null)
          {
              return NotFound();
          }
            var infractionInfo = await _context.InfractionInfos.FindAsync(id);

            if (infractionInfo == null)
            {
                return NotFound();
            }

            return infractionInfo;
        }

        [Authorize]
        // PUT: api/InfractionInfos/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutInfractionInfo(string id, InfractionInfo infractionInfo)
        {
            if (id != infractionInfo.UsersId)
            {
                return BadRequest();
            }

            _context.Entry(infractionInfo).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!InfractionInfoExists(id))
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
        // POST: api/InfractionInfos
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<InfractionInfo>> PostInfractionInfo(InfractionInfo infractionInfo)
        {
          if (_context.InfractionInfos == null)
          {
              return Problem("Entity set 'DMVContext.InfractionInfos'  is null.");
          }
            _context.InfractionInfos.Add(infractionInfo);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (InfractionInfoExists(infractionInfo.UsersId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetInfractionInfo", new { id = infractionInfo.UsersId }, infractionInfo);
        }

        [Authorize]
        // DELETE: api/InfractionInfos/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteInfractionInfo(string id)
        {
            if (_context.InfractionInfos == null)
            {
                return NotFound();
            }
            var infractionInfo = await _context.InfractionInfos.FindAsync(id);
            if (infractionInfo == null)
            {
                return NotFound();
            }

            _context.InfractionInfos.Remove(infractionInfo);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool InfractionInfoExists(string id)
        {
            return (_context.InfractionInfos?.Any(e => e.UsersId == id)).GetValueOrDefault();
        }
    }
}
