using APS.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace APS.Data;

public class Repository(ApdatadbContext context)
{
    private readonly ApdatadbContext _context = context;
    protected ApdatadbContext Context => _context;

    public async Task<bool> ExistsAsync<T>(object id) where T : class
    {
        return await FindOneByIdAsync<T>(id) != null;
    }

    public async Task<T> FindOneByIdAsync<T>(object id) where T : class
    {
        var found = await _context.FindAsync<T>([id]);
        return found;
    }
}
