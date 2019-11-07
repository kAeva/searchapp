package model;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public interface Dao<T> {
    Optional<T> get(long id);

    List<T> getAll();

    void save(T t);

    void update(T t, String[] params) throws SQLException;

    void delete(T t) throws SQLException;
}
