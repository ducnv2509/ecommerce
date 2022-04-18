package DAO;

import java.util.List;

abstract class DAO<E, K> {
    abstract public void insert(E entity);

    abstract public void update(E entity);

    abstract public void delete(K key) throws Exception;

    abstract public List<E> findAll();

    abstract public E findByID(K key);
}