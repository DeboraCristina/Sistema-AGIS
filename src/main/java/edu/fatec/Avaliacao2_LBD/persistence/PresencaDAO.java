package edu.fatec.Avaliacao2_LBD.persistence;

import edu.fatec.Avaliacao2_LBD.model.Curso;
import edu.fatec.Avaliacao2_LBD.model.Disciplina;
import edu.fatec.Avaliacao2_LBD.model.Presenca;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class PresencaDAO implements ICRUD<Presenca> {
    GenericDAO gdao;

    public PresencaDAO(GenericDAO gdao) {
        this.gdao = gdao;
    }


    @Override
    public String insert(Presenca presenca) throws SQLException, ClassNotFoundException {
        return "";
    }

    @Override
    public String update(Presenca presenca) throws SQLException, ClassNotFoundException {
        return "";
    }

    @Override
    public String delete(Presenca presenca) throws SQLException, ClassNotFoundException {
        return "";
    }

    @Override
    public Presenca find(Presenca presenca) throws SQLException, ClassNotFoundException {
        return null;
    }

    @Override
    public List<Presenca> list() throws SQLException, ClassNotFoundException {

        return List.of();
    }

    public List<Curso> listCurso() throws SQLException, ClassNotFoundException {
        List<Curso> cursos = new ArrayList<>();

        Connection c= gdao.getConnection();
        String sql = """
                select c.codigo,
                       c.nome
                from curso c
                """;
        PreparedStatement ps = c.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Curso curso = new Curso();

            curso.setCodigo(rs.getInt(1));
            curso.setNome(rs.getString(2));

            cursos.add(curso);
        }

        return cursos;
    }

    public List<Disciplina> listDisciplina(Curso curso) throws SQLException, ClassNotFoundException {
        List<Disciplina> disciplinas = new ArrayList<>();

        Connection c= gdao.getConnection();
        String sql = """
                select d.codigo,
                       d.nome
                from disciplina d, curso c, curso_disciplina cd
                where cd.cod_disciplina = d.codigo and
                      cd.cod_curso = c.codigo and
                      c.codigo = ?
                order by d.nome
                """;
        PreparedStatement ps = c.prepareStatement(sql);
        ps.setInt(1, curso.getCodigo());

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Disciplina disciplina = new Disciplina();

            disciplina.setCodigo(rs.getInt(1));
            disciplina.setNome(rs.getString(2));

            disciplinas.add(disciplina);
        }

        return disciplinas;
    }

    public List<Presenca> listPresenca(Disciplina disciplina) throws SQLException, ClassNotFoundException {
        List<Presenca> presencas = new ArrayList<>();

        Connection c= gdao.getConnection();
        String sql= """
                select convert(varchar, p.data, 103) as dataFomatada,
                       md.semestre_matricula,
                       p.id
                from presenca p, matricula_disciplina md, conteudo c, disciplina d, aluno a, matricula m
                where p.id_matricula_disc = md.id and
                      p.id_conteudo = c.id and
                      c.cod_disciplina = d.codigo and
                      md.ra_matricula = m.ra and
                      m.cpf_aluno = a.cpf and
                      d.codigo = ?
                """;
        PreparedStatement ps = c.prepareStatement(sql);
        ps.setInt(1, disciplina.getCodigo());

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Presenca presenca = new Presenca();

            presenca.setData(rs.getString("dataFomatada"));
            presenca.setSemestre(rs.getInt("semestre_matricula"));
            presenca.setId(rs.getInt("id"));

            presencas.add(presenca);
        }

        return presencas;
    }
}
