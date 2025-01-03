﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ExpressFood.Domain.Domain;
using ExpressFood.Repository.Interface;
using Microsoft.EntityFrameworkCore;

namespace ExpressFood.Repository.Implementation
{
    public class Repository<T> : IRepository<T> where T : BaseEntity
    {
        private readonly ApplicationDbContext context;
        private DbSet<T> entities;

        public Repository(ApplicationDbContext context)
        {
            this.context = context;
            entities = context.Set<T>();
        }
        public IEnumerable<T> GetAll()
        {
            return entities.AsEnumerable();
        }
        public IEnumerable<FoodItem> GetAllFoodItems()
        {
            return context.FoodItems.Include(x => x.Restaurant);
        }

        public FoodItem GetFoodItem(Guid? id)
        {
            return context.FoodItems.Include(x => x.Restaurant).FirstOrDefault(f => f.Id == id);
        }
        public T Get(Guid? id)
        {
            return entities.FirstOrDefault(e => e.Id == id);
        }


        public T Insert(T entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException("entity");
            }
            entities.Add(entity);
            context.SaveChanges();
            return entity;
        }

        public T Update(T entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException("entity");
            }
            entities.Update(entity);
            context.SaveChanges();
            return entity;
        }

        public T Delete(T entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException("entity");
            }
            entities.Remove(entity);
            context.SaveChanges();
            return entity;
        }

        public List<T> InsertMany(List<T> entities)
        {
            if (entities == null)
            {
                throw new ArgumentNullException("entities");
            }
            entities.AddRange(entities);
            context.SaveChanges();
            return entities;
        }
       
    }

}
