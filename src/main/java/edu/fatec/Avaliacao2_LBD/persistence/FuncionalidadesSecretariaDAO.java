package edu.fatec.Avaliacao2_LBD.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import edu.fatec.Avaliacao2_LBD.model.Aluno;
import edu.fatec.Avaliacao2_LBD.model.Curso;
import edu.fatec.Avaliacao2_LBD.model.Matricula;

@Repository
public class FuncionalidadesSecretariaDAO {
	GenericDAO gdao;

	public FuncionalidadesSecretariaDAO(GenericDAO gdao) {
		this.gdao = gdao;
	}

	public List<Matricula> buscarAlunos(String tipo_busca, String valor_pesquisa)
			throws SQLException, ClassNotFoundException {
		Connection con = gdao.getConnection();
		String query = "SELECT f.cpf AS cpf, f.ra AS ra, f.nome_aluno AS nome_aluno, f.nome_curso AS nome_curso, f.dt_matricula AS dt_matricula, ";
		query += "f.pontuacao_vestibular AS pontuacao_vestibular, f.posicao_vestibular AS posicao_vestibular FROM fn_pesquisar_alunos (?, ?) AS f";

		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, tipo_busca);
		ps.setString(2, valor_pesquisa);

		List<Matricula> matriculas = new ArrayList<Matricula>();
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Curso curso = new Curso();
			Aluno aluno = new Aluno();
			Matricula matricula = new Matricula();

			aluno.setCpf(rs.getString("cpf"));
			aluno.setNome(rs.getString("nome_aluno"));
			aluno.setNome_social(rs.getString("nome_aluno"));

			curso.setNome(rs.getString("nome_curso"));

			matricula.setRa(rs.getString("ra"));
			String[] dt = rs.getString("dt_matricula").split("/");
			matricula.setAno_ingresso(Integer.parseInt(dt[0]));
			matricula.setSemestre_ingresso(Integer.parseInt(dt[1]));
			matricula.setPontuacao_vestibular(rs.getInt("pontuacao_vestibular"));
			matricula.setPosicao_vestibular(rs.getInt("posicao_vestibular"));
			matricula.setAluno(aluno);
			matricula.setCurso(curso);

			matriculas.add(matricula);
		}

		return matriculas;
	}

	public Matricula buscarAluno(String ra) throws SQLException, ClassNotFoundException {
		Connection con = gdao.getConnection();
		String query = "SELECT f.ra AS ra, f.nome_aluno AS nome_aluno, f.nome_curso AS nome_curso, f.dt_matricula AS dt_matricula,  ";
		query += "f.pontuacao_vestibular AS pontuacao_vestibular, f.posicao_vestibular AS posicao_vestibular FROM fn_dados_de_aluno (?) AS f";

		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, ra);

		Curso curso = new Curso();
		Aluno aluno = new Aluno();
		Matricula matricula = new Matricula();
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {

			aluno.setNome(rs.getString("nome_aluno"));
			aluno.setNome_social(rs.getString("nome_aluno"));

			curso.setNome(rs.getString("nome_curso"));

			matricula.setRa(rs.getString("ra"));
			String[] dt = rs.getString("dt_matricula").split("/");
			matricula.setAno_ingresso(Integer.parseInt(dt[0]));
			matricula.setSemestre_ingresso(Integer.parseInt(dt[1]));
			matricula.setPontuacao_vestibular(rs.getInt("pontuacao_vestibular"));
			matricula.setPosicao_vestibular(rs.getInt("posicao_vestibular"));
			matricula.setAluno(aluno);
			matricula.setCurso(curso);
		}

		return matricula;
	}
}
