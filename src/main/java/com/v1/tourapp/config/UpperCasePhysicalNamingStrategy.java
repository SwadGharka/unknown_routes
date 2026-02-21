package com.v1.tourapp.config;

import java.util.Locale;
import org.hibernate.boot.model.naming.Identifier;
import org.hibernate.boot.model.naming.PhysicalNamingStrategyStandardImpl;
import org.hibernate.engine.jdbc.env.spi.JdbcEnvironment;

public class UpperCasePhysicalNamingStrategy extends PhysicalNamingStrategyStandardImpl {
  @Override
  public Identifier toPhysicalTableName(Identifier name, JdbcEnvironment ctx) {
    return Identifier.toIdentifier(name.getText().toUpperCase(Locale.ROOT));
  }

  @Override
  public Identifier toPhysicalColumnName(Identifier name, JdbcEnvironment ctx) {
    return Identifier.toIdentifier(name.getText().toUpperCase(Locale.ROOT));
  }
}
